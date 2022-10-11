# frozen_string_literal: true

module Vehicle
  extend ActiveSupport::Concern
  included do
    $a= 0 
    def shop_info(user_id)
      @user = ServiceCenter.where(user_id: user_id)
    end
  end

  def get_association(params)
    @a = ServiceCenter.find(params[:id])
    @a.service_types.create(name: params[:service_name], cost: params[:service_cost])
  end

  def slot_association(params)
    @service_center_id = ServiceCenter.find(params[:id])
    @service_center_id.slots.create(name:params[:name])
  end  

  def client_owner_association_for_order(params,id,cost)
    @service_center_id = ServiceCenter.find(params[:id])
    @service_center_id.clients.create(name:params[:name],vehicle_number:params[:vehicle_number],contact_number:params[:contact_number],user_id:id,category:params[:category],cost:cost)
  end  

  def add
    $a
  end 
  
  def client_info(id)
    @user = Client.where(user_id: id).pluck(:id)
  end  

end

# t.string "name"
# t.string "vehicle_number"
# t.string "contact_number"
# params[:id], params[:service_name], params[:service_cost]