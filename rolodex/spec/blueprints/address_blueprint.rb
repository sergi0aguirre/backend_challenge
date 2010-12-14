Address.blueprint {
  address_type {AddressType.make}
  contact {Contact.make}
  address {Faker::Address.street_address}
  zip {Faker::Address.zip_code}
  city {Faker::Address.city}
  state {Faker::Address.us_state}
  country {Faker::Address.uk_country}

}