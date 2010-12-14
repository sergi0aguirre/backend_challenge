Address.blueprint {
  address_type{
    address=AddressType.make
    address.save
    address
  }
  contact {
    contact=Contact.make
    contact.save
    contact
  }
  address {Faker::Address.street_address}
  zip {Faker::Address.zip_code}
  city {Faker::Address.city}
  state {Faker::Address.us_state}
  country {Faker::Address.uk_country}

}