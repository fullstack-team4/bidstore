class ProductsController < ApplicationController
def add_to_cart
  @product = Product.find(params[[:id]])
  redirect_to :back
end

end
