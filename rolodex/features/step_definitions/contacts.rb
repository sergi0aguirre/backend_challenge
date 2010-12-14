#
# Table example:
#      | first_name | middle_name | last_name | company |
#      | sergio1    | Tobias      | aguirre1  | cardex  |
#
Given /^I have the following contacts created by "([^"]*)":$/ do |email,table|
  user=User.where(:email => email).first
  raise Exception.new("User with email: #{email} not found") unless user
  table.hashes.each do |hash|
    Contact.create!(
      :user_id=> user.id,
      :first_name => hash[:first_name],
      :middle_name => hash[:middle_name],
      :last_name => hash[:last_name],
      :company_name => hash[:company]
    )
  end
end

