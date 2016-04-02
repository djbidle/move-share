class Servicearea < ActiveRecord::Base
  belongs_to :user
  has_many :resources
  acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'}
  
    
  #add filter for distance of move
  def get_workorders()
    Workorder.within(self.radius, :origin => [self.lat, self.lng])
  end
end
