#
# Creates a full data for test
#
#
#
def create_data_test
  5.times do
    user = User.make
    user.save
    #creeate and assing list
    5.times do
      list=List.make
      list.save
      user.lists << list
    end
    #create and assign contacts
    5.times do
    user.contacts << create_contact
    ContactList.create(:list => user.lists.first, :contact => user.contacts.last)
    ContactList.create(:list => user.lists.last, :contact => user.contacts.last)
    end
    user.save
  end
end

def create_contact
  contact = Contact.make
  contact.save
  address = Address.make
  address.save
  contact.addresses << address
  phone = PhoneNumber.make
  phone.save
  contact.phone_numbers << phone
  contact.save
  contact
end



