PhoneNumber.blueprint{
  number { Utils::random_number(7) }
  contact { Contact.make }
  phone_type { PhoneType.make }
}