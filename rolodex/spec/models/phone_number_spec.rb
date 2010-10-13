require 'spec_helper'

describe PhoneNumber do

  before(:each) do
    @phone_number = Factory(:phone_number)
  end

  it { should belong_to(:contact) }
  it { should belong_to(:phone_type) }

  it { should validate_presence_of(:area_code) }
  it { should validate_presence_of(:number) }

  it { should validate_uniqueness_of(:number).
                  scoped_to(:area_code, :contact_id) }

  it { should validate_format_of(:area_code).
                  with('123').
                  with_message(/invalid phone number/) }

  it { should validate_format_of(:area_code).
                  not_with('1234').
                  with_message(/invalid phone number/) }

  it { should validate_format_of(:number).
                  with('1234567').
                  with_message(/invalid phone number/) }

  it { should validate_format_of(:number).
                  not_with('12345678').
                  with_message(/invalid phone number/) }

  describe 'the full_number virtual attribute' do
    it "should create a formated full number from valid area code and number" do
      @phone_number.area_code = '123'
      @phone_number.number    = '1234567'

      @phone_number.full_number.should == '(123)-123-4567'
    end

    it "should set valid number and areacode from formated number" do
      @phone_number.full_number = '(123)-123-4567'

      @phone_number.area_code.should == '123'
      @phone_number.number.should    == '1234567'
    end
  end

  pending 'should delegate phone type name to phone type model'
  pending 'should have a virtual attribute setter for the phone type'

end
