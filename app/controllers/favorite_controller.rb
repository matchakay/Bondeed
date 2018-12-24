class FavoriteController < ApplicationController
  def add
    if session[:id] != nil
      @favorite = Favorite.new(user_id: session[:id], favorite_user_id: params[:id])
      if @favorite.save
        flash[:success] = "お気に入り成功"
        redirect_to "/page/#{params[:id]}"
      else
        flash[:danger] = "お気に入り失敗"
        redirect_to "/page/#{params[:id]}"
      end
    else
      redirect_to "/user/login"
    end
  end

  def delete
    if session[:id] != nil
      if Favorite.where(user_id: session[:id]).where(favorite_user_id: params[:id]).delete_all
        flash[:success] = "削除成功"
        redirect_to "/page/#{params[:id]}"
      else
        flash[:danger] = "削除失敗"
        redirect_to "/page/#{params[:id]}"
      end
    else
      redirect_to "user/login"
    end
  end
end