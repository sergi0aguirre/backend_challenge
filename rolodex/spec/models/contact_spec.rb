require 'spec_helper'

describe Contact do
  before(:each) do
    @contact = Contact.make
  end

  it { should have_many(:phone_numbers) }
  it { should have_many(:addresses) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should have_many(:lists).through(:contact_lists) }


  it 'Should  validate_uniqueness_of(:first_name).scoped_to(:last_name) ' do
    # For an strange reason it doesnt work , so , lets test that the validation is working
    Contact.create(:first_name => "Sergio",:last_name =>"Aguirre")
    contact = Contact.new(:first_name => "Sergio",:last_name =>"Aguirre")
    contact.valid?.should be_false
  end

end
