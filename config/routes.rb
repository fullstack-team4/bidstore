Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  namespace :admin do
    resources :products
  end

  resources :orders

  root 'products#index'

end
