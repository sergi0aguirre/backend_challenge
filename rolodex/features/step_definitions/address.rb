#
#      | address  | city  | zip   | state  | country |
#      | street 1 | city1 | 12345 | state1 | country |
#      | street 2 | city2 | 14345 | state2 | country |
#      | street 3 | city3 | 11345 | state3 | country |
#

Given /^the contact with name "([^"]*)" created by "([^"]*)" has the following addresses:$/ do |name,email,table|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user
  contact=Contact.where(["first_name =? AND user_id=?",name,user.id]).first
  raise Exception.new("Contact with name: #{name} not found") unless contact
  table.hashes.each do |hash|
    addresstype=AddressType.create(:name => "home")
    Address.create!(
      :contact_id=> contact.id,
      :address => hash[:address],
      :zip => hash[:zip],
      :country => hash[:country],
      :city => hash[:city],
      :state => hash[:state],
      :address_type_id => addresstype.id
    )
  end
end


Then /^I follow the "([^"]*)" link of the addreess "([^"]*)" for contact "([^"]*)" and created by "([^"]*)"$/  do |type,address,name,email|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user

  contact=Contact.where(["first_name =? AND user_id=?",name,user.id]).first
  raise Exception.new("Contact with email: #{name} not found") unless contact

  address=Address.where(["address =? AND contact_id=?",address,contact.id]).first
  raise Exception.new("Address with address: #{address} not found") unless address
  click_link("address_#{type}_#{address.id}")

end