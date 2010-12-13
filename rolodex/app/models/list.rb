class List < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, :through => :contact_lists
  has_many   :contact_lists

  validates :name ,:presence=>true
  
end