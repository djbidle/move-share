module UsersHelper
    
    def get_userorders(user)    
        user.workorders.each do |workorder|
            workorder.id
            workorder.address
            workorder.destination
            workorder.distance_text
            workorder.duration_text
                 
            res = workorder.resources.first()
                if res.packing
                    'packing'.html_safe
                end
                      
                if res.moving
                    'moving'.html_safe
                end
                      
                if res.rickshaw
                    'rickshaw'.html_safe
                end      
                
                if res.car
                    'car'.html_safe
                end
                
                if res.van
                    'van'.html_safe
                end
                      
                if res.truck
                    'truck'.html_safe
                end
                      
                if res.semi
                    'semi'.html_safe
                end
                    
            end
    end    
end

