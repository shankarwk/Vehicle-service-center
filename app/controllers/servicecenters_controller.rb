# frozen_string_literal: true

# sasas

# Some documentation for Person
class ServicecentersController < ApplicationController
  before_action :authenticate_user!, only: %i[new shop_detail]
  include Vehicle

  def index
    @all = ServiceCenter.all
  end

  def create
    @service = ServiceCenter.new(service_params)
    @service.user = current_user
    redirect_to shop_detail_servicecenters_path if @service.save
  end

  def new
    @a = ServiceCenter.new
  end

  def service_type
    @id = params[:id]
  end

  def add_service
    get_association(params[:id], params[:service_name], params[:service_cost])
    flash[:n] = 'add succesfully'
  end

  def shop_detail
    @shop = shop_info(current_user.id)
  end

  def profile
    if current_user
      @profile = shop_info(current_user.id)
    else
      redirect_to root_path
    end
  end

  private

  def service_params
    params.require(:service_center).permit(:shop_name, :shop_owner, :location, :address)
  end
end
