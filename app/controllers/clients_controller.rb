class ClientsController < ApplicationController
    before_action :authenticate_user!
    include Vehicle
    def index
    end     

    def show_data
        @d = Client.find(params[:id])
        @data  = CategoryList.find_by(name:@d.category)
        @u = User.find(@d.user_id)
    end
    def show
        @client = client_info(params[:id])
    end

    def create
        @admin = CategoryList.new(client_params)
        @admin.save
    end
    
    def admin 
    end    
    def user_profile
        if current_user.user_rule == "shop owner" 
            @shop_owner = shop_info(current_user.id)
        elsif current_user.user_rule =="client"
            redirect_to client_path(current_user.id)
        else
            redirect_to admin_path_clients_path
        end            
    end    

    private
    def client_params
        params.require(:category_list).permit(:name,:cost,:time)
    end    

   
end
