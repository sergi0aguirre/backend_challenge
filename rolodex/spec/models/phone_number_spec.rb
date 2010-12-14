require 'spec_helper'
require 'spec_util'

describe PhoneNumber do

  before(:each) do
    @phone_number = PhoneNumber.make
    @phone_number.area_code = Utils::random_number(3)
  end

  it { should belong_to(:contact) }
  it { should belong_to(:phone_type) }

  it { should validate_presence_of(:area_code) }
  it { should validate_presence_of(:number) }

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

  it 'should  have  a virtual  phone type name' do
    @phone_number.phone_type_name.should == @phone_number.phone_type.name
  end

  it 'should  have  a virtual  phone type name' do
    @phone_number.should respond_to(:phone_type_name)
  end
  
  # it { should validate_uniqueness_of(:number).
  #                scoped_to(:area_code, :contact_id) }
  # For an strange reason it doesnt work , so , lets test that the validation is working
  it 'Should valid  pair validations i mean  don acept the same cobination' do
    contact = Contact.make
    PhoneNumber.create(:area_code =>"123",:number => "1234567", :contact=> contact)
    number = PhoneNumber.new(:area_code =>"123",:number => "1234567", :contact=> contact)
    number.valid?.should be_false
  end

end
