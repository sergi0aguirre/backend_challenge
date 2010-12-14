List.blueprint{
  name {Faker::Name.first_name}
  user  {
    user=User.make
    user.save
    user
  }
}