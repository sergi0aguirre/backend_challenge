require 'spec_helper'

describe User do
   before(:each) do
    @user = User.make
  end

  it { should have_many(:lists) }
  it { should have_many(:contacts) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_format_of(:email).with('5ddrema16@mail.com') }
  it { should validate_format_of(:email).with('seam16_678.er@mail.com') }
  it { should_not allow_value("blah").for(:email) }
  it { should_not allow_value("blahdf@c.m").for(:email) }
  it { should_not allow_value("1").for(:password) }
  it { should allow_value("123456").for(:password) }
end
