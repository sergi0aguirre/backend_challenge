require "erb"
include ERB::Util
namespace :default do

  desc "Default information"
  task(:all => [:users, :contacts, :address_types, :phone_types]) do
    puts "Default Data created Successfully!"
  end

  #Create the  default users
  task(:users=> :environment) do
    10.times do |user|
      User.create(:email => "user#{user}@rolodex.com", :password => "123456", :password_confirmation => "123456")
    end
    puts "Users Created"
  end

  #Create contacts  for Each user
  task(:contacts=> :environment) do
    Contact.destroy_all
    users=User.all
    users.each do |user|
      20.times do |iterator|
        Contact.create(:first_name => "firts_n#{iterator}#{user.email[0,10]}", :middle_name => "middle_name#{iterator}", :last_name => "last_name#{iterator}", :user => user)
      end
    end
    puts "We have created new contacts for each user"
  end

  #Create the  default address types
  task(:address_types=> :environment) do
    AddressType.destroy_all
    AddressType.create(:name => "home")
    AddressType.create(:name => "office")
    puts "Addreesses Created"
  end

  #Create the  default us phone types
  task(:phone_types=> :environment) do
    PhoneType.destroy_all
    PhoneType.create(:name => "home")
    PhoneType.create(:name => "office")
    puts "Addreesses Created"
  end

end
