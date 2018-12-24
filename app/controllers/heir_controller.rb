class HeirController < ApplicationController
  #詳細情報入力振り分け
  def show
    if session[:id] != nil && !Heir.find_by(user_id: session[:id])
      @heir = Heir.new
      render :heir
    elsif session[:id] == nil
      redirect_to "/user/login"
    else
      @heir = Heir.find_by(user_id: session[:id])
      @interest = ArtCategory.find(@heir.art_category_id)
      render :show
    end
  end

  #詳細情報入力
  def create
    if session[:id] != nil
      params[:heir][:user_id] = session[:id]
      @heir = Heir.new(heir_params)
      if @heir.save
        flash[:success] = "登録成功"
        redirect_to "/heir/show"
      else
        flash[:danger] = "登録失敗"
        redirect_to "/heir/show"
      end
    else
      redirect_to "/user/login"
    end
  end

  #更新ページ
  def update_page
    if session[:id] != nil
      @heir = Heir.find_by(user_id: session[:id])
      @interest = ArtCategory.find(@heir.art_category_id)
      render :update
    else
      redirect_to "/user/login"
    end
  end

  #更新
  def update
    if session[:id] != nil
      @heir = Heir.find_by(user_id: session[:id])
      if @heir.update_attributes(art_category_id: params[:heir][:art_category_id], introduction: params[:heir][:introduction])
        flash[:success] = "更新成功"
        redirect_to "/heir/show"
      else
        flash[:danger] = "更新失敗"
        redirect_to "/heir/update"
      end
    else
    end
  end
end

private
def heir_params
  params.require(:heir).permit(:user_id, :art_category_id, :introduction)
end