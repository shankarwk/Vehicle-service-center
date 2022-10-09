# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  root to: 'service_centers#index'
  resources :service_centers do
    collection do
      get 'shop_detail', to: 'service_centers#shop_detail'
      get 'profile', to: 'service_centers#profile'
      get 'admin', to: 'service_centers#admin'
      get 'you_profile', to: 'service_centers#your_profile' 
      get 'client_profile', to: 'service_centers#client_profile'     
    end    
  end
  get 'client_request/:id', to: 'service_centers#client_request',as: :client_request
  get 'add_service/:id', to: 'service_centers#add_service', as: :add_service
  get 'request_to_owner/:id', to:'service_centers#request_to_owner',as: :request_to_owner
  post 'order_confirmation/:id' , to: 'service_centers#order_confirmation',as: :order_confirmation
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :slot ,except: %i[create]
  post 'create/:id', to: 'slot#create'
end
