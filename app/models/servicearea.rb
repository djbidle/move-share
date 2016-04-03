class Servicearea < ActiveRecord::Base
  belongs_to :user
  has_many :resources
  acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address'}
  
    
  def get_workorders()
    temp = Workorder.within(self.radius, :origin => [self.lat, self.lng])
    temp = temp.where("distance_value <= ?", self.move_distance)
    temp.joins(:resources).where("mask <= ?", self.resources.first.mask)
  end
end
