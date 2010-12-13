class List < ActiveRecord::Base
  belongs_to :user
  has_many   :contacts, :through => :contact_lists
  has_many   :contact_lists, :dependent => :destroy

  validates :name ,:presence=>true
  validates :user_id ,:presence=>true
  
end