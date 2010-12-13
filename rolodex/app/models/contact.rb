class Contact < ActiveRecord::Base

  has_many   :phone_numbers , :dependent => :destroy
  has_many   :addresses, :dependent => :destroy
  has_many   :lists, :through => :contact_lists
  has_many   :contact_lists
  belongs_to :user
  validates  :first_name, :presence=>true
  validates_uniqueness_of :first_name, :scope=>[:last_name]
  validates  :last_name, :presence=>true
  validates  :user_id, :presence=>true
  #Paperclip
  has_attached_file :photo, :styles => {:thumb=> "30x30#",
    :small  => "100x100>" },
    :url  => "/assets/photos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension",
    :default_url => "missing_:style.jpg"

  scope :search, lambda { |key,user_id|  where(["(first_name LIKE ? OR middle_name LIKE ? OR last_name LIKE ? OR company_name LIKE ?) AND user_id=?",key,key,key,key,user_id]) }
  scope :where_ids, lambda { |ids,user_id|  where(["id IN (#{ids}) AND user_id=?",user_id]) }

  # add a self to a list
  def add_to_list(list)
    self.contact_lists.create(:list => list)
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def to_vcard
    card=Vpim::Vcard.create

    Vpim::Vcard::Maker.make2(card) do |maker|

      maker.add_name do |name|
        name.given = self.full_name
      end

      #Add the company name
      company= self.company_name || ""
      maker.add_company(company)

      #Add the photo
      picture=  SITE_URL+self.photo.url(:small) || ""
      maker.add_picture(picture)

      #Load all the addresses
      addresses=self.addresses
      addresses.each do |address|
        maker.add_addr do |addr|
          addr.location = address.address_type_name
          addr.street = address.address
          addr.locality = address.city
          addr.region = address.state
          addr.postalcode = address.zip
        end
      end
      phones=self.phone_numbers
      phones.each do |phone|
        maker.add_tel(phone.full_number) do |tel|
          tel.location =phone.phone_type_name
          tel.preferred = true
        end
      end
    end
    card.to_s
    
  end
  #List the contacts
  def self.filter(key,order,user)
    Contact.search("%"+key+"%",user).order(order)
  end


end
