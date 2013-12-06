class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to chat_path(@message.chat_id)
    else
      render ''
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end