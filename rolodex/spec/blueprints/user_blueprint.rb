User.blueprint{
  email {Faker::Internet.email}
  password {"123456"}
  password_confirmation {password}
}