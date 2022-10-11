
class ServiceCentersController < ApplicationController
  load_and_authorize_resource except: %i[index client_request your_profile client_profile order_confirmation] 
  before_action :authenticate_user!, except: %i[index]
  include Vehicle
  

  def index
    @all = ServiceCenter.all
  end
  
  def all_shop
  end  

  def new_form
  end 

  def edit

  end 

  def update_to
  end  


  def destroy
  end 



  def order_confirmation
    authorize! :update, ServiceCenter
    @data = Client.find(params[:id])
    @service = ServiceCenter.find(@data.service_center_id) 
    @slots = @service.slots.where(status:"available").first
    @slots.update(status:"booked")
    @user = User.find_by(id:@data.user_id)
    @data.update(status:"booked")
    UserMailer.with(email: @user.email).order_mail.deliver_later
  end  

  def admin 
  end


  def request_to_owner
    @data = Client.where(service_center_id:params[:id])
  end  
  


  def new

  end
 
  def create_shop
    @service = ServiceCenter.new(service_params)
    @service.user = current_user
    redirect_to shop_detail_service_centers_path if @service.save
  end  
 
  def show
    @request_id = ServiceCenter.find(params[:id])
    @cat = @request_id.service_types.find_by(name:params[:category])
    @cost = @cat.cost
    client_owner_association_for_order(params,current_user.id,@cost)
  end


  def add_service
    get_association(params)
    flash[:n] = 'succesfully'
    redirect_to shop_detail_service_centers_path
  end

  def shop_detail
    @shop = shop_info(current_user.id)
  end

  def client_request
    @service_type = ServiceType.where(service_center_id:params[:id])
    @request_id = ServiceCenter.find(params[:id])
    @slots  = Slot.where(service_center_id:params[:id])
    
  end  

  private

  def service_params
    params.permit(:shop_name, :shop_owner, :location, :address)
  end
end
