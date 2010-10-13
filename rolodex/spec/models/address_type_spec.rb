require 'spec_helper'

describe AddressType do
  before(:each) do
    @address_type = Factory(:address_type)
  end

  %w(home office).each do |value|
    it { should allow_value(value).for(:name) }
  end

  %w(cave planet).each do |value|
    it { should_not allow_value(value).for(:name) }
  end

end
