Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  resources :cart_items

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :users
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end


  namespace :account do
    resources :users
    resources :orders do
      member do
        post :pay_with_wechat
        post :pay_with_alipay
      end
    end
  end

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :user
        post :admin
      end
    end
  end

  root 'welcome#index'

end
