class ChatsController < ApplicationController

  before_action :authorize

  def index
    @chats = current_user.chats
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
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
    params.require(:chat).permit(:members)
  end
end