
class ServiceCentersController < ApplicationController
  load_and_authorize_resource except: %i[index client_request your_profile client_profile order_confirmation] 
  before_action :authenticate_user!, except: %i[index]
  include Vehicle
  

  def index
    begin
      a=6
      Message::AddService.new().print(a)
      @all = ServiceCenter.all
    rescue => exception
      puts exception
    end
  end
  
  def all_shop
    @all = ServiceCenter.all
  end  

  def show_data
    a = Client.find(params[:id])
  end  
  def shop_list

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
    @data.update(confirm_slot:@slots.name)
    UserMailer.with(email: @user.email).order_mail.deliver_later
  end  

  def admin 
  end


  def request_to_owner
    @service_center_id = ServiceCenter.find(params[:id])
    service_center_id = @service_center_id.slots.where(status:"available")
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
    @category_time = @cat.time
    client_owner_association_for_order(params,current_user.id,@cost,@cate)
  end


  def add_service
    get_association(params)
    flash[:n] = 'succesfully'
    redirect_to shop_detail_service_centers_path
  end

  def shop_detail
    @shop = shop_info(current_user.id)
    @category = CategoryList.all
  end

  def client_request 
    @request_id = ServiceCenter.find(params[:id])
    @a = @request_id.service_types.pluck(:name)
    @time = Client.where(service_center_id:@request_id)

    @slots  = Slot.where(service_center_id:params[:id])
    
  end  

  private

  def service_params
    params.permit(:shop_name, :shop_owner, :location, :address)
  end
end
