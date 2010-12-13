class List < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, :through => :contact_lists
  has_many   :contact_lists

  validates :name ,:presence=>true
  validates :user_id ,:presence=>true


  #Expoirt a list to vcard
  def contacts_to_vcards
    contacts=self.contacts
    vcards=""
    contacts.each do |contact|
        vcards << contact.to_vcard
    end
    vcards
  end

end