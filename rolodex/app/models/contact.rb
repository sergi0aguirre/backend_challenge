class Contact < ActiveRecord::Base

  has_many   :phone_numbers
  has_many   :addresses
  has_and_belongs_to_many   :contact_lists
  has_many   :lists, :through => :contact_lists
  belongs_to :user
  validates  :first_name, :presence=>true
  validates_uniqueness_of :first_name, :scope=>[:last_name]
  validates  :last_name, :presence=>true

  # add a self to a list
  def add_to_list(list)

  end
end
