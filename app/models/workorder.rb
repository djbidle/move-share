class Workorder < ActiveRecord::Base
  has_many :resources
  belongs_to :user
  acts_as_mappable :auto_geocode=>{:field=>:origin, :error_message=>'Could not geocode address'}
    
  def update()
    matrix = Workorder.get_google_matrix(self.origin, self.destination)
    self.update_column(:distance_text, matrix.distance_text)
    self.update_column(:distance_value, matrix.distance_in_meters)
    self.update_column(:duration_text, matrix.duration_text)
    self.update_column(:duration_value, matrix.duration_in_seconds)
  end
  
  def assign(user)
    self.update_column(:accepted_by, user)
    self.update_column(:is_assigned, true)
  end
  
  
  private
  
    def Workorder.get_google_matrix(start_address, destination_address)
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
