class ProductsController < ApplicationController
    def add_to_cart
      @product = Product.find(params[:id])
      if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "已经将 #{@product.title} 加入购物车"
      else
        flash[:warning] = "购物车已有此物"
      end
      redirect_to :back
    end

    def index
      @products = Product.where(:is_hidden => false)
    end


    def show
      @product = Product.find(params[:id])
    end


    private

    def product_params
      params.require(:product).permit(:title, :description, :product, :quantity, :price, :image, :is_hidden, :begintime, :endtime)
    end

end
