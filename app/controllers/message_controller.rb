class MessageController < ApplicationController
  #表示
  def view
    if session[:creator] != nil
      @message_list = User.joins(:message_lists).select("users.*, message_lists.*").where(message_lists: {creator_user_id: session[:id]}).order("message_lists.updated_at DESC")
      @message = Message.new
      render :message
    elsif  session[:id] != nil && session[:creator] == nil
      @message = Message.new
      render :message
    else
      redirect_to "/index"
    end
  end

  #新規追加
  def message_list_add
    if session[:creator] != nil
      message_list = MessageList.new(creator_user_id: session[:id], heir_user_id: params[:id])
       if message_list.save
         redirect_to "/message/list"
       else

       end
    elsif session[:id] != nil && session[:creator] == nil
      message_list = MessageList.new(creator_user_id: params[:id], heir_user_id: session[:id])
      if message_list.save
        redirect_to "/message/list"
      else

      end
    else
      redirect_to "/index"
    end
  end


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

private
def message_list_params
  params.require(:message_list).permit(:creator_user_id, :heir_user_id)
end