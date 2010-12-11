# Load the rails application
require File.expand_path('../application', __FILE__)
Paperclip::Railtie.insert
# Initialize the rails application
Rolodex::Application.initialize!
