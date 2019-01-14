class MyPageController < ApplicationController
  def my_page
    begin
      if session[:id] == nil
        flash.now[:danger] = "ログインしてください"
        redirect_to "/index"
      else
        @user = User.find(session[:id])
      end
    rescue => e
      render :my_page
      logger.error e
    end
  end

  def show
    begin
      @user = User.find(session[:id])
      render :update
    rescue => e
      logger.error e
    end
  end

  # アップデート実行
  def update
    begin
      @user = User.find(session[:id])
      # :name => params[:user][:name], :email => params[:user][:email], :phone_number => params[:user][:phone_number], :postal_code => params[:user][:postal_code], :address_1 => params[:user][:address_1], :address_2 => params[:user][:address_2], :profile => params[:user][:profile]
      if @user.update_attributes(:avatar_path => params[:user][:avatar_path], :name => params[:user][:name], :email => params[:user][:email], :phone_number => params[:user][:phone_number], :profile => params[:user][:profile])
        flash[:success] = "success"
        render :show
      else
        flash.now[:danger] = "エラー"
        render :show
      end
    rescue => e
      logger.error e
    end
  end
end
