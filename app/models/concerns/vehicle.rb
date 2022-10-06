module Vehicle
    extend ActiveSupport::Concern
    included do
        def shop_info(user_id) 
            @user = ServiceCenter.where(user_id:user_id)
        end 
    end    

    def get_association(id,service_name,service_cost)
        id.service_types.create(name:service_name,cost:service_cost)
    end    
end    