Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  root :to => "servicecenters#index"
  resources :servicecenters do
    collection do
      get 'shop_detail', to: "servicecenters#shop_detail" 
    end
  end  
  get 'service_type/:id', to: "servicecenters#service_type" , as: :service_type
  get 'add_service/:id', to: "servicecenters#add_service" , as: :add_service
  post '/ajax', to: 'servicecenters#ajax', as: :ajax
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
