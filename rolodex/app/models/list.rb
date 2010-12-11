class List < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, :through => :contacts_lists
  has_many   :contacts_lists

  validates :name ,:presence=>true
  
end