ContactList.blueprint{
  contact {
    contact=Contact.make
    contact.save
    contact
  }
  list {
    list=List.make
    list.save
    list
  }
}