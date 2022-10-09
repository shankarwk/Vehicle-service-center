# frozen_string_literal: true

# sasas

# Some documentation for Person
class ServiceCentersController < ApplicationController
  load_and_authorize_resource except: %i[index client_request your_profile client_profile order_confirmation] 
  before_action :authenticate_user!, except: %i[index ]
  include Vehicle
  

  def index
    @all = ServiceCenter.all
  end

  def order_confirmation
    authorize! :update, ServiceCenter
    @data = Client.find(params[:id])
    @user = User.find_by(id:@data.user_id)
    @data.update(status:"booked")
    UserMailer.with(email: @user.email).order_mail.deliver_later
  end  

  def create
    @service = ServiceCenter.new(service_params)
    @service.user = current_user
    redirect_to shop_detail_servicecenters_path if @service.save
  end

  def admin 
  end

  def client_profile  

  end  

  def request_to_owner
    @data = Client.where(service_center_id:params[:id])
  end  
  
  def your_profile 
    if current_user.user_rule == "shop owner"
      redirect_to profile_service_centers_path  
    else
      redirect_to client_profile_service_centers_path  
    end

  end  

  def new
    @a = ServiceCenter.new
  end

 
  def show
    @request_id = ServiceCenter.find(params[:id])
    client_owner_association_for_order(params,current_user.id)
  end


  def add_service
    get_association(params)
    flash[:n] = 'succesfully'
    redirect_to shop_detail_service_centers_path
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

  def client_request
    @request_id = ServiceCenter.find(params[:id])
  end  

  private

  def service_params
    params.require(:service_center).permit(:shop_name, :shop_owner, :location, :address)
  end
end
