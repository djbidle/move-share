class Resource < ActiveRecord::Base
  
  def update_mask()
    mask_value = 0
    if (self.packing)
      mask_value += 1
    end
    if (self.moving)
      mask_value += 10
    end
    if (self.rickshaw)
      mask_value += 100
    end
    if (self.car)
      mask_value += 1000
    end
    if (self.van)
      mask_value += 10000
    end
    if (self.truck)
      mask_value += 100000
    end
    if (self.semi)
      mask_value += 1000000
    end
    self.update_column(:mask, mask_value)
  end
end
