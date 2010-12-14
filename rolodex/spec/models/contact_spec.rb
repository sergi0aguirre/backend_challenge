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

  it 'should  have  a full name method' do
    @contact.should respond_to(:full_name)
  end

  it 'should  have  a full name method and contain first name ...last name, ' do
    @contact.full_name.should == "#{@contact.first_name} #{@contact.middle_name} #{@contact.last_name}"
  end

  it 'Should  validate_uniqueness_of(:first_name).scoped_to(:last_name) ' do
    # For an strange reason it doesnt work , so , lets test that the validation is working
    Contact.create(:first_name => "Sergio",:last_name =>"Aguirre")
    contact = Contact.new(:first_name => "Sergio",:last_name =>"Aguirre")
    contact.valid?.should be_false
  end

  describe 'Search and filter with load data ' do
    describe 'Should filter' do
      create_data_test
      describe 'Should search for especific keys and params' do
        it 'should  have  a search method' do
          Contact.should respond_to(:search)
        end
      end

      it 'should  have  a filter method' do
        Contact.should respond_to(:filter)
      end

      it 'should  give me only what i sked to filter a) only for an especific user' do
        contact=Contact.last
        user=contact.user
        contacts = Contact.filter('','first_name ASC',user.id)
        contact=user.contacts.last
        contacts.should include(contact)
      end

      it 'should  give me only what i sked to filter b) with a key search by company name ' do
        contact=Contact.last
        user=contact.user
        keycontact=user.contacts.first
        contacts = Contact.filter(keycontact.company_name,'first_name ASC',user.id)
        contact=user.contacts.last
        contacts.first.company_name.should == keycontact.company_name
      end

   
  

      describe 'Should Filter by ids' do
        it 'should  have  a where_ids method' do
          Contact.should respond_to(:where_ids)
        end

        it 'should  give me onle contacts with the ids that i  sent it' do
          contact=Contact.last
          user=contact.user
          contact = user.contacts.last
          contact2 = user.contacts.first
          contacts = Contact.where_ids("#{contact.id},#{contact2.id}",user.id)
          contacts.count.should > 0
        end

      end

    end

  end

  describe 'Should be added to a list' do
    it 'should  have  a add_to_list method' do
      @contact.should respond_to(:add_to_list)
    end

    it 'should be added to a list' do
      list=List.make
      list.user_id=@contact.user_id
      list.save
      @contact.save
      @contact.add_to_list(list)
      list.contacts.last.should == @contact
    end
  end
  
  describe 'Should respond to a method (to_vcard) to convert this user to a vcard' do
    it { @contact.should respond_to(:to_vcard) }
    it 'Should respond to a method (to_vcard) and we chould have a va card with all the contact information' do
      @contact.save
      #Adding Addresses to contact
      address1=Address.make
      address2=Address.make
      @contact.addresses<<address1
      @contact.addresses<<address2

      #Adding Phone Numbers to contact
      phone1=PhoneNumber.make
      phone2=PhoneNumber.make
      @contact.phone_numbers<<phone1
      @contact.phone_numbers<<phone2

      # the Strings expected
      name=@contact.full_name
      company="COMPANY::"+@contact.company_name
      address=address1.city+";"+address1.state+";"+address1.zip
      phone="TEL;TYPE="+phone2.phone_type_name+",pref:"+phone2.full_number
      #create the vcard
      @contact.to_vcard.should include(name,company,address,phone)
    end

  end



end
