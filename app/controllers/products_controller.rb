class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:favor, :quit]

    def add_to_order
      @product = Product.find(params[:id])
      if params[:is_buyout].present? && params[:is_buyout] == "true"
        price = @product.buyout
      else
        price = @product.bids.last.amount
      end
      redirect_to :back
    end

    def add_to_cart
      price = 0
      @product = Product.find(params[:id])
      if params[:is_buyout].present? && params[:is_buyout] == "true"
        price = @product.buyout
      else
        price = @product.bids.last.amount.round
      end

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
      search = params[:tag]
      case search
      when "netceleb"
        @products = Product.where(tag: "netceleb", :is_hidden => false)
      when "sportceleb"
        @products = Product.where(tag: "sportceleb", :is_hidden => false)
      when "movieceleb"
        @products = Product.where(tag: "movieceleb", :is_hidden => false)
      else
        @products = Product.where(:is_hidden => false)
      end
    end


    def show
      @product = Product.find(params[:id])
      @photos = @product.photos.all
      @bids = @product.bids.recent.paginate(:page => params[:page], :per_page => 5)
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

    def about
      render "products/about"
    end

    def contact
      render "products/contact"
    end

    # def netceleb
    #   render "products/netceleb"
    # end
    #
    # def sportceleb
    #   @products = Product.where(tag: "sportceleb")
    # end
    #
    # def movieceleb
    #   @products = Product.where(tag: "movieceleb")
    # end
    def send_message_before_auction
      #binding.pry
      @product = Product.find(params[:id])
      # t = @product.begintime - Time.now
      admin = User.first
      users = @product.members
      body = "#{@product.title}马上开拍"
      # "点击链接查看商品"link_to(@product.title, product_path(@product))
      subject = "#{@product.title}马上开拍"
      # if t <= 1800 && users.present?
        admin.send_message(users, body, subject)
        flash[:success] = "Message has been sent!"
      # end
    end


    def send_message_after_auction
      @product = Product.find(params[:id])
      # t = Time.now - @product.endtime
      admin = User.first
      users = @product.members
      body = "#{@product.title}已结束拍卖，感谢关注"
      subject = "#{@product.title}已结束拍卖，感谢关注"
      # if t >=0 && users.present?
        admin.send_message(users, body, subject)
        flash[:success] = "Message has been sent!"
      # end
    end


    def search
      if @query_string.present?
        search_result = Product.ransack(@search_criteria).result(distinct: true)
        @products_search = search_result.paginate(page: params[:page], per_page: 20)
      end
   end

   protected

   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
     @search_criteria = search_criteria(@query_string)
   end

   def search_criteria(query_string)
     { title_cont: query_string}
   end

    private

    def product_params
      params.require(:product).permit(:title, :description, :quantity, :price, :buyout, :image, :is_hidden, :begintime, :endtime, :aasm_state, :product_story, :tag)
    end


end
