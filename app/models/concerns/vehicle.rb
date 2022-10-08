# frozen_string_literal: true

module Vehicle
  extend ActiveSupport::Concern
  included do
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
end

# params[:id], params[:service_name], params[:service_cost]