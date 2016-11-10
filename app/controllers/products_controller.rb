class ProductsController < ApplicationController
    def add_to_cart
      @product = Product.find(params[[:id]])
      current_cart.add_product_to_cart(@product)
      redirect_to :back
    end

    def index
      @products = Product.all
    end


    def show
      @product = Product.find(params[:id])
    end



    private

    def product_params
      params.require(:product).permit(:title, :description, :product, :quantity, :price)
    end

end