Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :pay_with_wechat
        post :pay_with_alipay
      end
    end
  end

  namespace :account do
    resources :orders do
      member do
        post :pay_with_wechat
        post :pay_with_alipay
      end
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
    end
  end

  root 'products#index'

end
