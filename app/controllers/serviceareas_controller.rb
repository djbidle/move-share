class ServiceareasController < ApplicationController
  def new
    @serviceareas = User.find(1).serviceareas.new
    @resources = Resource.new
  end

  def create
    @user = User.find(1)
    @sa = @user.serviceareas.create!(params.require(:servicearea).permit(:address, :radius, :move_distance))
    @r = Resource.create!(params.require(:resource).permit(:packing, :moving, :rickshaw, :car, :van, :truck, :semi))
  end
end
