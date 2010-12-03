require 'spec_helper'

describe PhoneType do
 before(:each) do
    @contact = Factory(:phone_type)
  end

  it { should validate_presence_of(:name) }
  it { should have_many(:phone_numbers) }
end
