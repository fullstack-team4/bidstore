class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.page(params[:page])
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



  # 追问问题
  def create
    @question = Question.find(params[:question_id])
    # 出题人
    akser = @question.user
    # 问题内容和问题id绑定
    subject = @question.content
    # 回答内容
    answer_content = answer_params[:content]
    # 对话id
    conversation_id = answer_params[:conversation_id]
    # mailboxer方法
    # 如果之前没有对话，就新建对话。如果有，就回复对话

    if conversation_id.blank?
      conversation = current_user.send_message(akser ,answer_content ,subject,@question).conversation
        # xdite魔改后的send_message多了一个question参数
    else
      # 通过会话id获取会话
      conversation = @question.conversations.find(conversation_id)
      # binding.pry
      current_user.reply_to_conversation(conversation, answer_content)
    end

    # f470-变成待回答状态
    @question.reopened!

    # binding.pry
    flash[:notice] = "回复成功"
    redirect_to :back
  end


  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
