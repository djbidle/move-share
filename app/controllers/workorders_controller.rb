class WorkordersController < ApplicationController
  def new
    if logged_in?
      @workorders = current_user.workorders.new
      @resources = Resource.new
    else
      redirect_to login_url
    end
  end

  def create
    if logged_in?
      @user = current_user
      @wo = @user.workorders.create!(params.require(:workorder).permit(:address, :destination))
      @wo.update
      @r = Resource.create!(params.require(:resource).permit(:workorder_id, :packing, :moving, :rickshaw, :car, :van, :truck, :semi))
      @r.update_mask
      @r.update_column(:workorder_id, @wo.id)
      redirect_to @user
    else
      redirect_to login_url
    end
  end
end
