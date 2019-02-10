class IndexController < ApplicationController
  def index
    if session[:creator] != nil
      @creator = User.joins(:creators).select("users.*, creators.title, creators.user_id").where.not(creators: {user_id: session[:id]}).where(creators: {is_recruitment: true})
    else
      @creator = User.joins(:creators).select("users.*, creators.title, creators.user_id").where(creators: {is_recruitment: true})
    end
  end

  def root
    redirect_to "/index"
  end

  def search_user
    if params[:search][:art_category_id] != nil
      if session[:creator] != nil
        @creator = User.joins(:creators).select("users.*, creators.title, creators.user_id").where.not(creators: {user_id: session[:id]}).where(creators: {is_recruitment: true}).where(creators: {art_category_id: params[:search][:art_category_id]})
      else
        @creator = User.joins(:creators).select("users.*, creators.title, creators.user_id").where(creators: {is_recruitment: true}).where(creators: {art_category_id: params[:search][:art_category_id]})
      end
      render
    end
  end
end