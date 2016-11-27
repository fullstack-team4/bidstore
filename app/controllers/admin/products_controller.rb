class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def new
    @product = Product.new
    @photo = @product.photos.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if params[:photos] != nil
      @product.photos.destroy_all

      params[:photos]['avatar'].each do |a|
        @picture = @product.photos.create(:avatar => a)
      end

      @product.update(product_params)
      redirect_to admin_products_path

    elsif @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if params[:photos] !=nil
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(:avatar => a)
        end
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "Product deleted"
    redirect_to admin_products_path
  end

  def index
    @products = Product.all.paginate(:page => params[:page], :per_page => 6)
  end

  def sell
    @product = Product.find(params[:id])
    @product.sell!
    redirect_to :back
  end

  def notsell
    @product = Product.find(params[:id])
    @product.notsell!
    redirect_to :back
  end

  def start_auction
    @product = Product.find(params[:id])
    @product.start_auction!
    redirect_to :back
  end

  def deal
    @product = Product.find(params[:id])
    @product.deal!
    redirect_to :back
  end

  def fail
    @product = Product.find(params[:id])
    @product.fail!
    redirect_to :back
  end




  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :buyout, :image, :is_hidden, :begintime, :endtime, :aasm_state, :product_story, :tag)
  end

end
