class Contact < ActiveRecord::Base

  has_many   :phone_numbers
  has_many   :addresses
  has_many   :lists, :through => :contacts_lists
  belongs_to :user
  validates  :first_name, :presence=>true
  validates_uniqueness_of :first_name, :scope=>[:last_name]
  validates  :last_name, :presence=>true
  validates  :user_id, :presence=>true

  scope :search, lambda { |key|  where(["first_name LIKE ? OR middle_name LIKE ? OR last_name LIKE ?",key,key,key]) }

  # add a self to a list
  def add_to_list(list)

  end
end
