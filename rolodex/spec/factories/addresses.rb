# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :address do |f|
  f.contact_id 1
  f.address "MyString"
  f.zip "12345-1234"
  f.city "MyString"
  f.state "MyString"
  f.country "MyString"
  f.address_type_id 1
end
