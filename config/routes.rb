Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :public do
    resources :addresses, only: [:index, :edit, :create,:update,:destroy]
  end
  namespace :public do
    get 'orders/complete'
    post 'orders/comfirm'
    resources :orders, only: [:new, :create, :index, :show]
  end
  namespace :public do
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  namespace :public do
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only: [:show, :edit, :update]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
