PhoneNumber.blueprint{
  area_code { Utils::random_number(3) }
  number { Utils::random_number(7) }
  contact {
    contact=Contact.make
    contact.save
    contact
  }
  phone_type{
    ptype=PhoneType.make
    ptype.save
    ptype
  }
}