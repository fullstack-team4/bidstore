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
<<<<<<< HEAD
      params.require(:product).permit(:title, :description, :product, :quantity, :price, :buyout, :image, :is_hidden, :begintime, :endtime)
=======
      params.require(:product).permit(:title, :description, :quantity, :price, :image, :is_hidden, :begintime, :endtime, :aasm_state)
>>>>>>> dd641248f84c590b33b1ffcb70348c3d086c38c6
    end

end
