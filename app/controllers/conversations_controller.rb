class ConversationsController < ApplicationController
  # include ConversationsHelper
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index, :empty_trash]
  before_action :get_box, only: [:index]

  # def index
  #   @conversations = @mailbox.inbox.page(params[:page])
  # end

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

  def show
    # @conversation = Conversation.find(params[:id])
    # # 根据id查找到指定对话
    # @conversation = @question.conversations.find(params[:id])
    # @messages = @conversation.messages
    # # binding.pry
    #
    # @new_answer = Answer.new
    #
    # # binding.pry
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end
  # 追问问题
  # def create
  #   @question = Question.find(params[:question_id])
  #   # 出题人
  #   akser = @question.user
  #   # 问题内容和问题id绑定
  #   subject = @question.content
  #   # 回答内容
  #   answer_content = answer_params[:content]
  #   # 对话id
  #   conversation_id = answer_params[:conversation_id]
  #   # mailboxer方法
  #   # 如果之前没有对话，就新建对话。如果有，就回复对话
  #
  #   if conversation_id.blank?
  #     conversation = current_user.send_message(akser ,answer_content ,subject,@question).conversation
  #       # xdite魔改后的send_message多了一个question参数
  #   else
  #     # 通过会话id获取会话
  #     conversation = @question.conversations.find(conversation_id)
  #     # binding.pry
  #     current_user.reply_to_conversation(conversation, answer_content)
  #   end
  #
  #   # f470-变成待回答状态
  #   @question.reopened!
  #
  #   # binding.pry
  #   flash[:notice] = "回复成功"
  #   redirect_to :back
  # end
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

  def mark_as_read
    @conversation.mark_as_read(current_user)
    flash[:success] = 'The conversation was marked as read.'
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
