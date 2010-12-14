class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :lists
  has_many :contacts

  #Export all teh contacts of especific user  to vcards
  def contacts_to_vcards
    contacts=self.contacts
    vcards=""
    contacts.each do |contact|
        vcards << contact.to_vcard
    end
    vcards
  end
end
