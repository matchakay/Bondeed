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
      @user = User.all
      render :admin_user_edit
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

  #ユーザー削除
  def user_delete
    if User.delete(params[:id])
      flash[:success] = "success"
      render action: :user
    else
      flash[:danger] = "error"
    end
  end

  #ユーザー編集
  def user_edit_show
    @user = User.find_by("id = ?", params[:id])
    render :selected_user_edit
  end

  #patch
  def user_edit
    user = User.find_by("id = ?", params[:id])
    if user.update_attributes(:avatar_path => params[:user][:avatar_path], :profile => params[:user][:profile])
      flash[:success] = "success"
      redirect_to "/admin/management/user"
    else
      flash.now[:danger] = "error"
    end
  end

  #ダイアリー削除
  def diary_delete
    if Diary.delete(params[:id])
      flash[:success] = "success"
      render action: :diary
    else
      flash[:danger] = "error"
      render action: :diary
    end
  end

  #ダイアリーコメント削除
  def diary_comment_delete
    if DiaryComment.delete(params[:id])
      flash[:success] = "success"
      render action: :diary_comment
    else
      flash[:danger] = "error"
      render action: :diary_comment
    end
  end

  #ギャラリー削除
  def gallery_delete
    if Gallery.delete(params[:id])
      flash[:success] = "success"
      render action: :gallery
    else
      flash[:danger] = "error"
      render action: :gallery
    end
  end

  private
  def session_check
    if session[:admin] == nil
      redirect_to "/admin/index"
    end
  end
end
