class Servicearea < ActiveRecord::Base
  belongs_to :user
  has_many :resources
  acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'}
  
    
  def get_workorders()
    temp = Workorder.within(self.radius, :origin => [self.lat, self.lng])
    #add trip distance filter
    #add resource filter
  end
end
