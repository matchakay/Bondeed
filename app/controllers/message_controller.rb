class MessageController < ApplicationController
  #表示
  def view
    if session[:id] != nil
      @message = Message.new
      render :message
    else
      redirect_to "/user/login"
    end
  end

  #新規追加


  #投稿
  def send_message
    if session[:id] != nil
      params[:message][:send_user_id] = session[:id]
      params[:message][:receive_user_id] = params[:receive_user_id]
      @message = Message.new(message_params)
      if @message.save

      else

      end
      redirect_to "/message/view"
    else
      redirect_to "/user/login"
    end

  end
end

private
def message_params
  params.require(:message).permit(:send_user_id, :receive_user_id, :content)
end