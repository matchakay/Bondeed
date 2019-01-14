class GalleryController < ApplicationController

  #お気に入りユーザのギャラリー
  def favorite_gallery
    if session[:creator] != nil
      @gallery = Gallery.new
      @favorite_gallery = User.joins(:galleries).select("users.*, galleries.*, galleries.id AS page_id").where(galleries: {user_id: session[:id]}).or(User.joins(:galleries).select("users.*, galleries.*, galleries.id AS page_id").where(galleries: {user_id: Favorite.where(user_id: session[:id]).select("favorites.favorite_user_id")})).order("galleries.created_at DESC")
      render :favorite_gallery
    end
  end

  #マイギャラリー
  def my_gallery
    if session[:id] != nil
      @gallery = Gallery.new
      @my_gallery = Gallery.where(user_id: session[:id]).order("created_at DESC")
      render :my_gallery
    else
      redirect_to "/index"
    end
  end

  #ユーザ別ギャラリー
  def user_view
    @gallery = Gallery.new
    @user = User.find(params[:id])
    @user_gallery = User.left_joins(:galleries).select("users.*", "galleries.*").where(galleries: {user_id: params[:id]}).order("galleries.created_at DESCs")
    render :user_gallery_view
  end

  #投稿 post
  def upload
    if session[:creator] != nil
      params[:gallery][:user_id] = session[:creator]
      @gallery = Gallery.new(gallery_params)
      if @gallery.save
        flash[:success] = "success"
      else
        flash[:danger] = "エラー"
      end
      redirect_to "/gallery/my_gallery"
    else
      redirect_to "/index"
    end
  end

  #個別画像
  def selected_gallery
    @selected_gallery = Gallery.find_by("id = ?", params[:id])
    @selected_gallery_user = User.joins(:creators).select("users.*, creators.*").find(@selected_gallery.user_id)
    #タグ検索
    @match_tag = Gallery.tagged_with([@selected_gallery.tag_list], :any => true).where.not(user_id: @selected_gallery.user_id).order("RAND()").limit(3)
    #ユーザの他投稿
    @other_gallery = Gallery.where(user_id: @selected_gallery.user_id).where.not(id: params[:id]).order("RAND()").limit(2)
  end

end

private
def gallery_params
  params.require(:gallery).permit(:user_id, :data, :comment, :tag_list)
end