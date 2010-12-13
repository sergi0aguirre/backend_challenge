class Contact < ActiveRecord::Base

  has_many   :phone_numbers , :dependent => :destroy
  has_many   :addresses, :dependent => :destroy
  has_many   :lists, :through => :contact_lists
  has_many   :contact_lists , :dependent => :destroy
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

  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
  #List the contacts
  def self.filter(key,order,user)
    Contact.search("%"+key+"%",user).order(order)
  end
end
