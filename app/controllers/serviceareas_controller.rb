class ServiceareasController < ApplicationController
  def new
    if logged_in?
      @serviceareas = current_user.serviceareas.new
      @resources = Resource.new
    else
      redirect_to login_url
    end
  end

  def create
    if logged_in?
      @user = current_user
      @sa = @user.serviceareas.create!(params.require(:servicearea).permit(:address, :radius, :move_distance))
      @r = Resource.create!(params.require(:resource).permit(:servicearea_id, :packing, :moving, :rickshaw, :car, :van, :truck, :semi))
      @r.update_mask
      @r.update_column(:servicearea_id, @sa.id)
      redirect_to @user
    else
      redirect_to login_url
    end
  end
end
