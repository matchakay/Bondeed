class UserController < ApplicationController

  def login
    if session[:id] == nil
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:id] = user[:id]
        if user[:is_creator]
          session[:creator] = user[:id]
        end
        redirect_to "/index"
      else
        flash[:danger] = '『メールアドレス』もしくは『パスワード』が誤っています'
        redirect_to "/index"
      end
    end
  end

  def logout
    session[:id] = nil
    session[:creator] = nil
    flash[:success] = "ログアウト"
    redirect_to "/index"
  end

  def regist
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了"
      redirect_to "/user/login"
    else
      render action: :regist
    end
  end

  def password_forgot
    render :password_forgot
  end

  def email_exist
    begin
      if params[:user_email][:email] != ""
        if user = User.find_by(email: params[:user_email][:email])
          session[:reset_id] = user[:id]
          redirect_to "/user/password_reset"
        else
          flash.now[:danger] = "入力されたメールアドレスは存在しません"
          render :password_forgot
        end
      else
        flash.now[:danger] = "メールアドレスを入力してください"
        render :password_forgot
      end
    rescue => e
      render :password_forgot
    end
  end

  def password_edit
    @user = User.new
    render :password_reset
  end

  def password_reset
    begin
      @user = User.find(session[:reset_id])
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        flash.now[:success] = "更新成功"
        session[:reset_id] = nil
        render :login
      else
        flash.now[:dangers] = "更新失敗"
        render :password_edit
      end
    rescue => e

    end
  end

end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation, :avatar_path, :email, :birthday, :is_man, :is_creator)
end