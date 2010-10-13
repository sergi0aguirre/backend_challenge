# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :phone_number do |f|
  f.contact_id 1
  f.area_code "222"
  f.number "2222222"
  f.phone_type_id 1
end
