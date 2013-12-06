class ChatsController < ApplicationController

  before_action :authorize

  def index
    @chats = current_user.chats
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new()
    if @chat.save
      chat_params[:user_ids].each do |id|
        Membership.create(user_id: id, chat_id: @chat.id)
      end
      redirect_to chat_path(@chat)
    else
      render 'new'
    end
  end

  def show
    @messages = Message.where(chat_id: params[:id])
    @message = Message.new(chat_id: params[:id])
  end

private

  def chat_params
    params.require(:chat).permit(:user_ids => [])
  end
end