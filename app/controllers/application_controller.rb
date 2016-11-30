class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_notification
  helper_method :current_cart

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  def current_cart
    @current_cart ||= find_cart
  end

  def get_notification
    @notifications ||= Notification.where(users: current_user).unread
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def require_is_verified
    if !current_user.is_verified?
      flash[:alert] = 'You are not verified'
      redirect_to edit_account_user_path(current_user)
    end
  end


end
