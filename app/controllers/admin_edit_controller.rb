class AdminEditController < ApplicationController
  before_action :session_check
  def index
    if session[:admin] != nil
      render :admin_index
    else
      redirect_to "/admin/login"
    end
  end

  def user
    if session[:admin] != nil
      @user = User.all
      render :admin_user_edit
    else
      redirect_to "/admin/index"
    end
  end

  def diary
    if session[:admin] != nil
      @diary = Diary.all
      render :admin_diary_edit
    else
      redirect_to "/admin/index"
    end
  end

  def diary_comment
    @diary_comment = DiaryComment.all
    render :admin_diary_comment_edit
  end

  def gallery
    @gallery = Gallery.all
    render :'admin_edit/admin_gallery_edit'
  end

  def inquiry
    @inquiry = Inquiry.all
    render :admin_inquiry_edit
  end

  private
  def session_check
    if session[:admin] == nil
      redirect_to "/admin/index"
    end
  end
end
