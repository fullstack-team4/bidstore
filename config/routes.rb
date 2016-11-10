Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :carts

resources :products do
  member do
    post :add_to_cart
  end
end

end
