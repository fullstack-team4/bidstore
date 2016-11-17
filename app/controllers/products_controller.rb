class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:favor, :quit]

    def add_to_cart


      price = 0
      @product = Product.find(params[:id])

      # binding.pry

      if params[:is_buyout].present? && params[:is_buyout] == "true"
        price = @product.buyout
      else
        price = @product.bids.last.amount.round
      end


      # @user = current_user
      # @product.user = current_user
      # @product.bid = @bid
      #
      # binding.pry
      #
      # if @product.endtime - Time.now < 0 #&& @product.bids.last.amout = @user.bids.last.amount
      #   flash[:notice] = "恭喜！您已中标！请进行下一步操作！"
      #   current_cart.add_product_to_cart(@product)
      # else
      #if @product.endtime-Time.now > 0 && @product.begintime-Time.now < 0
        if !current_cart.products.include?(@product)
          current_cart.add_product_to_cart(@product, price)
          flash[:notice] = "已经将 #{@product.title} 加入购物车"
        else
          flash[:warning] = "购物车已有此物"
        end
      #else
        #flash[:warning] = "拍卖结束或尚未开始，请关注竞拍时间！！"
      #end
      redirect_to :back
      # end
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
