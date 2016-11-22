class MessagesController < ApplicationController
  include MessagesHelper
  before_action :authenticate_user!
  before_action :get_mailbox

  def new
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

end
