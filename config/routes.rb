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
      get 'client_request', to: 'service_centers#client_request'
      post 'request_confimation', to: 'service_centers#request_confimation'
      get 'admin', to: 'service_centers#admin'
      get 'client_request', to: 'service_centers#client_profiel'
      get 'you_profile', to: 'service_centers#your_profile'

      
    end
    
  end
  get 'service_type/:id', to: 'service_centers#service_type', as: :service_type
  get 'add_service/:id', to: 'service_centers#add_service', as: :add_service
  post '/ajax', to: 'service_centers#ajax', as: :ajax
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :slot ,except: %i[create]
  post 'create/:id', to: 'slot#create'
end
