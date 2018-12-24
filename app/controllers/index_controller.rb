class IndexController < ApplicationController
  def index
    if session[:creator] != nil
      @creator = Creator.where.not(user_id: session[:id])
    else
      @creator = Creator.all
    end
    @user = User.where(is_creator: true)
  end
end