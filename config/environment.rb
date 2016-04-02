# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyBWMBb9b8OSfHrxNS8MzGLMJADV8j9u0iY'
Geokit::Geocoders::provider_order = [:google]
