class Address < ActiveRecord::Base
  belongs_to :address_type
  delegate :name, :to => :address_type, :prefix => true
end
