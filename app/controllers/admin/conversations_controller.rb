class Admin::ConversationsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: [:index]


  def index
    # binding.pry
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end

    @conversations = @conversations.page(params[:page])
  end

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to admin_conversations_path
  end

  #alfa gets the last conversation (chronologically, the first in the inbox)
  # conversation = alfa.mailbox.inbox.first
  #
  # #alfa gets it receipts chronologically ordered.
  # receipts = conversation.receipts_for alfa
  #
  # #using the receipts (i.e. in the view)
  # receipts.each do |receipt|
  #   ...
  #   message = receipt.message
  #   read = receipt.is_unread? #or message.is_unread?(alfa)
  #   ...

  def show
    @conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_user)
    flash[:success] = 'The conversation was moved to trash.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_user)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  private

  def get_box
    if params[:box].blank? or !["inbox", "sent", "trash"].include?(params[:box])
      params[:box] = 'inbox'
    end

    @box = params[:box]
  end

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end



end
