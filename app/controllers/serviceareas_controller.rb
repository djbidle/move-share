class ServiceareasController < ApplicationController
  def new
    @serviceareas = current_user.serviceareas.new
    @resources = Resource.new
  end

  def create
    @user = current_user
    @sa = @user.serviceareas.create!(params.require(:servicearea).permit(:address, :radius, :move_distance))
    @r = Resource.create!(params.require(:resource).permit(:packing, :moving, :rickshaw, :car, :van, :truck, :semi))
    redirect_to @user
  end
end
