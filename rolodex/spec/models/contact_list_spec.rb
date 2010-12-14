require 'spec_helper'

describe ContactList do
  before(:each) do
    @contactlist = ContactList.make
  end

  it { should belong_to(:list) }
  it { should belong_to(:contact) }

 
  it 'Should valid  pair validations i mean  don acept the same cobination' do
    ContactList.create(:contact_id => 1,:list_id => 1)
    contactlist=ContactList.new(:contact_id => 1,:list_id => 1)
    contactlist.valid?.should be_false
  end
end
