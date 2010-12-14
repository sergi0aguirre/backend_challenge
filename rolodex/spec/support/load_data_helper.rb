#
# Creates a full data for test
#
# Don't forget to use fixtures :product_attributes on the spec
#
#
def create_data_test
  10.times do
    user = User.make
    user.save
    #creeate and assing list
    5.times do
      user.lists << List.make
    end
    #create and assign contacts
    15.times do
    user.contacts << create_contact
    ContactList.create(:list => user.lists.first, :contact => user.contacts.last)
    ContactList.create(:list => user.lists.last, :contact => user.contacts.last)
    end
  end
end

def create_contact
  contact = Contact.make
  contact.save
  contact.addresses << Address.make
  contact.addresses << Address.make
  contact.phone_numbers << PhoneNumber.make
  contact.phone_numbers << PhoneNumber.make
  contact
end



