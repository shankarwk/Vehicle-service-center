class SlotController < ApplicationController
  include Vehicle
  def index
  end

  def show
  end

  def edit
  end

  def create
    slot_association(params)
    flash[:n] = "Slot add successfully"
    redirect_to shop_detail_service_centers_path
  end

  def update
  end
end
