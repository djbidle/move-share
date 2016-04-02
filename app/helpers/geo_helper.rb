module GeoHelper
  
  def do_x()
    #Geokit::Geocoders::GoogleGeocoder.geocode '789 Geary St, San Francisco, CA'
  end
  
  def get_google_matrix(start_address, destination_address)
    matrix = GoogleDistanceMatrix::Matrix.new
    matrix.configure do |config|
      config.mode = 'driving'
      config.units = 'imperial'
    end
    
    
    origin = GoogleDistanceMatrix::Place.new address: start_address
    destination = GoogleDistanceMatrix::Place.new address: destination_address
    
    matrix.origins << origin
    matrix.destinations << destination
    
    matrix.data[0][0]
  end
end