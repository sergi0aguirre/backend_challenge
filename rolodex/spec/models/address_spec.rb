require 'spec_helper'

describe Address do
  before(:each) do
    @address = Address.make
  end

  it { should belong_to(:contact) }
  it { should belong_to(:address_type) }

  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:contact_id) }
  it { should validate_presence_of(:address_type_id) }

  it { should validate_format_of(:zip).with('55416') }
  it { should validate_format_of(:zip).with('55416-6789') }
  it { should validate_format_of(:zip).not_with('554316') }
  it { should validate_format_of(:zip).not_with('554s6') }
  it { should validate_format_of(:zip).not_with('5 416') }
  it { should validate_format_of(:zip).not_with('554166789') }
  it { should validate_format_of(:zip).not_with('55416-67892') }
  it { should validate_format_of(:zip).not_with(' 55416 ') }

  it "should delegate address_type_name to address type" do
    @address.address_type_name.should == 'home'
  end

   it 'should  have  a virtual  address type name' do
    @address.should respond_to(:address_type_name)
  end
end
