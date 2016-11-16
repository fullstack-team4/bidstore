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

    def favor
      @product = Product.find(params[:id])
      if !current_user.favor?(@product)
        current_user.favor!(@product)
        flash[:notice] = "收藏成功"
      else
        flash[:warning] = "已经在收藏夹中了"
      end
      redirect_to :back
    end


    def quit
      @product = Product.find(params[:id])
      if current_user.favor?(@product)
        current_user.quit!(@product)
        flash[:alert] = "取消成功"
      else
        flash[:warning] = "尚未加入收藏"
      end
      redirect_to :back
    end




    private

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :buyout, :image, :is_hidden, :begintime, :endtime, :aasm_state)
    end

end
