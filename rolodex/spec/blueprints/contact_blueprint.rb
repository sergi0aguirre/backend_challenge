Contact.blueprint{
  first_name {Faker::Name.first_name}
  middle_name {Faker::Name.last_name}
  last_name {Faker::Name.last_name}
  user  {User.make}
}