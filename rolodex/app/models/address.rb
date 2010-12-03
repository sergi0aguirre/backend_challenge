class Address < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :contact
  delegate :name, :to => :address_type, :prefix => true
  validates :address , :presence=>true
  validates :zip, :presence=>true
  validates :city, :presence=>true
  validates :state, :presence=>true
  validates :contact_id, :presence=>true
  validates :address_type_id, :presence=>true
  validates_format_of :zip ,:with=>/^\d{5}([\-]\d{4})?$/i , :message=>"can't be blank"
end
