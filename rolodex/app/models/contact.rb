class Contact < ActiveRecord::Base

  has_many   :phone_numbers
  has_many   :addresses
  has_many   :lists, :through => :contacts_lists
  has_many   :contacts_lists
  belongs_to :user
  validates  :first_name, :presence=>true
  validates_uniqueness_of :first_name, :scope=>[:last_name]
  validates  :last_name, :presence=>true
  validates  :user_id, :presence=>true
  #Paperclip
  has_attached_file :photo, :styles => {:thumb=> "20x20#",
    :small  => "100x100>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  scope :search, lambda { |key,user_id|  where(["(first_name LIKE ? OR middle_name LIKE ? OR last_name LIKE ?) AND user_id=?",key,key,key,user_id]) }
  scope :where_ids, lambda { |ids,user_id|  where(["id IN (#{ids}) AND user_id=?",user_id]) }

  # add a self to a list
  def add_to_list(list)

  end

  #List the contacts
  def self.filter(key,order,user)
    Contact.search("%"+key+"%",user).order(order)

  end
end
