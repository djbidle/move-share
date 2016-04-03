class WorkordersController < ApplicationController
  def new
    @workorders = User.find(1).workorders.new
    @resources = Resource.new
  end

  def create
    @user = User.find(1)
    @wo = @user.workorders.create!(params.require(:workorder).permit(:address, :destination))
    @r = Resource.create!(params.require(:resource).permit(:workorder_id, :packing, :moving, :rickshaw, :car, :van, :truck, :semi))
    @r.update_column(:workorder_id, @wo.id)
  end
end
