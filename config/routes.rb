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
    resources :bids
    member do
      post :add_to_order
      post :add_to_cart
      post :favor
      post :quit
    end
    collection do
      get :about
      get :contact
    end
  end

  resources :conversations do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  namespace :bid do
    resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :apply_to_cancel
      end
    end
  end





  namespace :admin do
    resources :users
    resources :products do
      member do
        post :start_auction
        post :fail
        post :deal
      end
    end
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
    resources :bids
    resources :users
    resources :products
    resources :orders do
      member do
        #post :buyout
        post :pay_with_wechat
        post :pay_with_alipay
        post :shipped
        post :return
      end
    end
  end

  namespace :admin do
    resources :bids
    resources :products
    resources :users do
      member do
        post :verify
        post :user
        post :admin
      end
    end
  end

  namespace :admin do
    resources :products do
      member do
        post :sell
        post :notsell
      end
    end
  end

  root 'welcome#index'

end
