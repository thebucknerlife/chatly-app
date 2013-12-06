class ChatsController < ApplicationController

  before_action :authorize

  def index
    @chats = current_user.chats
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
  end

private

  def chat_params
    params.require(:chat).permit(:members)
  end
end