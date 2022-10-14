module Shop
    class OrderService
        
        def print(a)
            if a == 5
                raise "a should equal to 5 "
            end
        end
        
        def get_association(params)
            
            @a = ServiceCenter.find(params[:id])
            @list = @a.service_types.all.pluck(:name)
            @category = CategoryList.find_by(name:params[:category])
            if @list.include?(params[:category])
              raise  "This category already exits"
            else  
              @a.service_types.create(name:@category.name,cost:@category.cost,time:@category.time)
            end  
        end
    end     
end    