class AddressType < ActiveRecord::Base
  validates_inclusion_of :name, :in => %w( home office )
end
