Given /^a user with email "([^"]*)" and password "([^"]*)"$/ do |email,password|
  User.create(:email => email, :password => password)
end


Given /^I sign in with "(.*)\/(.*)" credentials$/ do |email, password|
  When %{I go to the new user session page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end