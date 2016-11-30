class Account::MessagesController < ApplicationController
  layout "account"
  before_action :authenticate_user!
  before_action :get_mailbox

  def new
  end

  def create
    admin = User.first
    conversation = current_user.send_message(admin, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "发送成功！"
    redirect_to account_conversation_path(conversation)
  end
  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
end
