class ServicecentersController < ApplicationController
    before_action :authenticate_user!,only: %i[new shop_detail] 
    include Vehicle

    def index
        
    end 
    
  

    def create
        @service = ServiceCenter.new(service_params)
        @service.user = current_user
        if @service.save
            redirect_to shop_detail_servicecenters_path
        end    
            
    end

    def new
    end

    def service_type
        @id = params[:id]
    end 

    def add_service
        @a = ServiceCenter.find(params[:id])
        @a.service_types.create(name:params[:service_name],cost:params[:service_cost])
        flash[:n] = "add succesfully"   
    end    
    
    def shop_detail
        @shop  = shop_info(current_user.id)
    end    

    private
    def service_params
        params.permit(:shop_name, :shop_owner, :location, :address)
    end    

    
end
