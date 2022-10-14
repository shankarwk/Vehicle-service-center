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
    @list = @a.service_types.all.pluck(:name)
    @category = CategoryList.find_by(name:params[:category])
    if @list.include?(params[:category])
      raise "This category already exits"
    else  
      @a.service_types.create(name:@category.name,cost:@category.cost,time:@category.time)
    end  
  end

  def slot_association(params)
    @service_center_id = ServiceCenter.find(params[:id])
    @service_center_id.slots.create(name:params[:name])
  end  

  def client_owner_association_for_order(params,id,cost,cat)
    @service_center_id = ServiceCenter.find(params[:id])
    @service_center_id.clients.create(name:params[:name],vehicle_number:params[:vehicle_number],contact_number:params[:contact_number],user_id:id,category:params[:category],cost:cost,request_time:Time.now.strftime("%T"),request_date:Time.now.strftime("%d %m %y"),category_time:cat)
  end  

  def add
    $a
  end 
  
  def client_info(id)
    @user = Client.where(user_id: id).pluck(:id)
  end  


  def next_service(date,client)
    month = date[3,3].to_i
    year = date[5,7].to_i
    date = date[0,2].to_i
    sum = month+3
    if sum<=12
      t = "#{date} #{sum} #{year}"
      client.update(next_date:t)
    else
      year = year+1
      month = sum - month
      client.update(next_date:t)
    end  
  end  

end
