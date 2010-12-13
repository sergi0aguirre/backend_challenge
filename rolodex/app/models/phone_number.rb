class PhoneNumber < ActiveRecord::Base

  FULL_PHONE_REGEX = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/
  INVALID_PHONE_MESSAGE = 'invalid phone number'

  belongs_to :contact
  belongs_to :phone_type

  delegate :name , :to=>:phone_type ,  :prefix=>true

  validates :area_code, :presence=>true
  validates :number , :presence=>true
  validates :phone_type_id , :presence=>true
  validates_uniqueness_of :number, :scope => [:area_code, :contact_id]

  validates_format_of :area_code, :with => /^\d{3}$/,
                      :message => INVALID_PHONE_MESSAGE
  validates_format_of :number, :with => /^\d{7}$/,
                      :message => INVALID_PHONE_MESSAGE

  def full_number
    "(#{area_code})-#{number[0..2]}-#{number[3..6]}"
  end

  def full_number=(full_num)
    match_data = FULL_PHONE_REGEX.match(full_num)
    if match_data
      self.area_code = match_data[1]
      self.number    = match_data[2] + match_data[3]
    end
  end


end
