class PhoneType < ActiveRecord::Base
    has_many :phone_numbers

    validates :name , :presence=>true
end
