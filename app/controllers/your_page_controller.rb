class YourPageController < ApplicationController
  #クリエイターページ
  def creator_show
    @user = User.find(params[:id])
    @creator = User.joins(:creator).select("users.*, creators.*").find_by(creators: {user_id: params[:id]})
    @art_category = ArtCategory.find_by(id: @creator.art_category_id)
    # @creator_image = CreatorImage.where(user_id: params[:id]).first
    @favorite = Favorite.new
    @fv_check = Favorite.where(user_id: session[:id]).where(favorite_user_id: params[:id]).first
    @match = Match.where(user_id: session[:id]).where(target_user_id: params[:id]).first
    render :your_page
  end

  #後継者ページ
  def heir_show
    @user = User.joins(:heirs).select("users.*", "heirs.*").where(users: {id: params[:id]}).first
    @scout = Match.where(user_id: session[:id]).where(target_user_id: params[:id])
    render :heir_page
  end
end