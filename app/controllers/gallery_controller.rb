class GalleryController < ApplicationController

  #お気に入りのギャラリー
  def view
    @gallery = Gallery.new
    render :view
  end

  #マイギャラリー
  def my_gallery
    if session[:id] != nil
      @gallery = Gallery.new
      @my_gallery = Gallery.where(user_id: session[:id]).order("created_at ASC")
      render :my_gallery
    else
      redirect_to "/user/login"
    end
  end

  #投稿 post
  def upload
    if session[:creator] != nil
      params[:gallery][:user_id] = session[:creator]
      @gallery = Gallery.new(gallery_params)
      if @gallery.save
        flash[:success] = "投稿成功"
      else
        flash[:danger] = "投稿成功"
      end
      redirect_to "/gallery/my_gallery"
    else
      redirect_to "/user/login"
    end
  end

  #個別画像
  def selected_gallery
    @selected_gallery = Gallery.find_by("id = ?", params[:id])
    @selected_gallery_user = User.joins(:creators).select("users.*, creators.*").find(@selected_gallery.user_id)
  end

end

private
def gallery_params
  params.require(:gallery).permit(:user_id, :data, :tag_list)
end