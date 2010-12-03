class List < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many   :contact_lists
  has_many   :contacts, :through => :contact_lists

  validates :name ,:presence=>true
  
end
