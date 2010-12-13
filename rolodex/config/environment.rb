# Load the rails application
 File.expand_path('../application', __FILE__)
 #Load  the Vcard customization
 require 'vcard/customize'
Paperclip::Railtie.insert
# Initialize the rails application
Rolodex::Application.initialize!
