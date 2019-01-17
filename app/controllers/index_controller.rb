class IndexController < ApplicationController
  def index
    @user = User.new
    if session[:creator] != nil
      @creator = Creator.where.not(user_id: session[:id])
    else
      @creator = Creator.all
    end
    @user = User.where(is_creator: true)
  end

  def root
    redirect_to "/index"
  end

  def search_user

  end
end