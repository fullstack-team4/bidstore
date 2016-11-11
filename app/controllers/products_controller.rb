class ProductsController < ApplicationController
    def add_to_cart
      @product = Product.find(params[:id])
      current_cart.add_product_to_cart(@product)
      redirect_to carts_path
    end

    def index
      @products = Product.all
    end


    def show
      @product = Product.find(params[:id])
    end



    private

    def product_params
      params.require(:product).permit(:title, :description, :product, :quantity, :price, :image)
    end

end
