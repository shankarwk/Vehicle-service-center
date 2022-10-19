class SlotController < ApplicationController
  include Vehicle
  def index
  end

  def show
    @service = ServiceCenter.find(params[:id])
    @slot = @service.slots.all
  end

  def edit
    @service = ServiceCenter.find(params[:service_id])
    @ed = @service.slots.find(params[:slot_id]) 
  end
 
  def update
    @edit = Slot.find(params[:id])
    @edit.update(slot_params)
  end

  def destroy
    @service = ServiceCenter.find(params[:service_id])
    @delete = @service.slots.find(params[:slot_id])
    @delete.destroy
  end
  

  def create
    slot_association(params)
    flash[:n] = "Slot add successfully"
    redirect_to shop_detail_service_centers_path
  end

  private
  def slot_params
      params.require(:slot).permit(:name,:status)
  end 

end
