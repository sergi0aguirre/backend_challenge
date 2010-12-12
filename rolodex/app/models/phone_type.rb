class PhoneType < ActiveRecord::Base
    has_many :phone_numbers

    validates_inclusion_of :name, :in => %w( home office movil)
end
