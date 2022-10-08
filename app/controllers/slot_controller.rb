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
  end

  def update
  end
end
