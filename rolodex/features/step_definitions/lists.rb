#
# Table example:
#      | first_name | middle_name | last_name | company |
#      | sergio1    | Tobias      | aguirre1  | cardex  |
#
Given /^I have the following list created by "([^"]*)":$/ do |email,table|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{name} not found") unless user
  table.hashes.each do |hash|
    List.create!(
      :user_id=> user.id,
      :name => hash[:name]
    )
  end
end



Given /^the list with name "([^"]*)" created by "([^"]*)" has the following contacts:$/ do |name,email,table|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user
  list=List.where(:name => name).first
  raise Exception.new("List with name: #{name} not found") unless list
  table.hashes.each do |hash|
    contact=Contact.create!(
      :user_id=> user.id,
      :first_name => hash[:first_name],
      :middle_name => hash[:middle_name],
      :last_name => hash[:last_name],
      :company_name => hash[:company]
    )
    list.contacts << contact
  end
end
