Contact.blueprint{
  first_name {Faker::Name.first_name}
  middle_name {Faker::Name.last_name}
  last_name {Faker::Name.last_name}
  company_name {Faker::Company.name}
  user {
    user=User.make
    user.save
    user
  }
}