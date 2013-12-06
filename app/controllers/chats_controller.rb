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

private

  def chat_params
    params.require(:chat).permit(:members)
  end
end