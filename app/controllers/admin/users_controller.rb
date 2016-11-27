class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  layout "admin"

   def index
     @users = User.all_except(current_user).paginate(:page => params[:page], :per_page => 8)
   end

   def user
     @user = User.find(params[:id])
     @user.is_admin = false
     @user.save
     redirect_to :back
   end

   def admin
     @user = User.find(params[:id])
     @user.is_admin = true
     @user.save
     redirect_to :back
   end

   def verify
     @user = User.find(params[:id])
     @user.is_verified = true
     @user.save
     redirect_to :back
   end

   def show
     @user = User.find(params[:id])
   end

end
