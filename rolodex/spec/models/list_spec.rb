require 'spec_helper'

describe List do
  before(:each) do
    @list = List.make
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should have_many(:contacts).through(:contact_lists) }

  describe 'Should respond to a method (contacts_to_vcards) to get all vcards of contacts in the list' do
    it { @list.should respond_to(:contacts_to_vcards) }
    it 'Should respond to a method (contacts_to_vcards) to get all vcards of contacts user' do
      #adding the contacts to a user
      contact1 = Contact.make
      contact2 = Contact.make
      @list.contacts << contact1 
      @list.contacts << contact2 
      #Lets create alot of contacts
      10.times do
        @list.contacts << Contact.make
      end
      contact_last = @list.contacts.last
      #lets check the method give us   all the contacts including the first ones and the last one  of this LIST
      contacts = @list.contacts_to_vcards
      contacts.should include(contact1.to_vcard, contact2.to_vcard, contact_last.to_vcard)
    end

  end
end
