
class ServiceCentersController < ApplicationController
  load_and_authorize_resource except: %i[index client_request your_profile client_profile order_confirmation] 
  before_action :authenticate_user!, except: %i[index]
  include Vehicle
  

  def index
    @all = ServiceCenter.all
    @q = ServiceCenter.ransack(params[:q])
    @address = @q.result(distinct: true)
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
    @data.update(confirm_date:Time.now.strftime("%d %m %y"))
    @data.update(confirm_time:Time.now.strftime("%T"))
    @next_date = next_service(@data.confirm_date,@data)
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
    client_owner_association_for_order(params,current_user.id,@cost,@category_time)
  end


  def add_service
    begin 
      # get_association(params)
      Shop::OrderService.new().get_association(params)
      flash[:n] = 'Your are added the category succesfully'
      redirect_to shop_detail_service_centers_path
    rescue => e
      flash[:n] = e
      redirect_to shop_detail_service_centers_path
    end    
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
  
  
  def charge
    service_center = ServiceCenter.find_by(id: params[:id])
    check = true
    if check
      s = StripeService.new
      token = s.create_card_token(params)
      customer = s.find_or_create_customer(current_user)
      token = s.create_card_token(params)
      card = s.create_stripe_customer_card(token.id,customer)
      s.create_stripe_charge(params[:amount_to_be_paid], customer.id, card.id, service_center)
      current_user.change_user_to_paid
      s.service_payment(current_user.id, params[:id], params[:amount_to_be_paid])
      flash[:notice] = 'Payment successfully completed without errors.'
      redirect_to root_path(current_user.id)
    else
      redirect_to user_path(current_user.id), alert: 'some error occured'
    end
  end
  def payment; end




  private

  def service_params
    params.permit(:shop_name, :shop_owner, :location, :address)
  end
end
