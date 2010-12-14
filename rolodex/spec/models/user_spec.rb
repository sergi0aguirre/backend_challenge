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

  describe 'Should respond to a method (contacts_to_vcards) to get all vcards of contacts user' do
    it { @user.should respond_to(:contacts_to_vcards) }
    it 'Should respond to a method (contacts_to_vcards) to get all vcards of contacts user' do
      #adding the contacts to a user
      contact1 = Contact.make
      contact2 = Contact.make
      @user.contacts << contact1
      @user.contacts << contact2
      #Lets create alot of contacts
      10.times do
        @user.contacts << Contact.make
      end
      contact_last = @user.contacts.last
      #lets check the method give us   all the contacts including the first ones and the last one
      contacts = @user.contacts_to_vcards
      contacts.should include(contact1.to_vcard, contact2.to_vcard, contact_last.to_vcard)
    end

  end 
end
