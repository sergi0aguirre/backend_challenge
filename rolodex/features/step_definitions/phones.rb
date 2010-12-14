Given /^the contact with name "([^"]*)" created by "([^"]*)" has the following phones:$/ do |name,email,table|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user
  contact=Contact.where(["first_name =? AND user_id=?",name,user.id]).first
  raise Exception.new("Contact with name: #{name} not found") unless contact
  table.hashes.each do |hash|
    phonetype=PhoneType.create(:name => "home")
    PhoneNumber.create!(
      :contact_id=> contact.id,
      :area_code => hash[:area_code],
      :number => hash[:number],
      :phone_type_id => phonetype.id
    )
  end
end


Then /^I follow the "([^"]*)" link of the phone "([^"]*)" for contact "([^"]*)" and created by "([^"]*)"$/  do |type,phone,name,email|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user

  contact=Contact.where(["first_name =? AND user_id=?",name,user.id]).first
  raise Exception.new("Contact with email: #{name} not found") unless contact

  phone=PhoneNumber.where(["number=? AND contact_id=?",phone,contact.id]).first
  raise Exception.new("PhoneNumber with phone: #{phone} not found") unless phone
  click_link("phone_#{type}_#{phone.id}")

end