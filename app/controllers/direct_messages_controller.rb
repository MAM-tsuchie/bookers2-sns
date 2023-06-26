class DirectMessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = DirectMessage.messages_with_the_user(current_user,@user)
    @message = DirectMessage.new
  end

  def create
    user = User.find(params[:user_id])
    @message = DirectMessage.new(direct_message_params)
    @message.sender = current_user
    @message.save
    redirect_to user_direct_messages_path(user)
  end

  def direct_message_params
    params.require(:direct_message).permit(:receiver_id,:message)
  end

end
