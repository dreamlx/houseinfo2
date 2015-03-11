Houseinfo2::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    resources :buildings
    resources :units
    resources :room_models
    resources :orders do
      member do
        put :confirm
        put :unconfirm
      end
    end
    
    resources :tokens
    resources :admin_users
    resources :rooms do
      resources :orders
    end
  end
  root :to => 'admin/dashboard#index'
end
