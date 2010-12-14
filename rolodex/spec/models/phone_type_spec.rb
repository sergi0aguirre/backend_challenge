require 'spec_helper'

describe PhoneType do
 before(:each) do
    @phonetype = PhoneType.make
  end

  it { should have_many(:phone_numbers) }

   %w( home office movil).each do |value|
    it { should allow_value(value).for(:name) }
  end
 
  %w(building phone).each do |value|
    it { should_not allow_value(value).for(:name) }
  end

end
