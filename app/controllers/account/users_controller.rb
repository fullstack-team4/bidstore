class Account::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to account_user_path(current_user)
      flash[:notice] = "认证信息更新成功！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :idcard)
  end

end
