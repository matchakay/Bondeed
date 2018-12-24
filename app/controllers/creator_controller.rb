class CreatorController < ApplicationController
  def show
    begin
      if session[:creator] != nil && !Creator.find_by(user_id: session[:id])
        @creator = Creator.new
        render :create
      else
        @creator = Creator.find_by(user_id: session[:id])
        @art_category = ArtCategory.find(@creator.category_id)
        render :show
      end
    rescue => e

    end
  end

  def create
    begin
      params[:creator][:user_id] = session[:id]
      @creator = Creator.new(creator_params)
      if @creator.save
        flash.now[:success] = "登録完了"
        redirect_to "/creator/show"
      else
        flash.now[:danger] = "登録失敗"
        render :create
      end
    rescue => e
    end
  end

  def edit
    begin
      if session[:creator] != nil
        @creator = Creator.find_by(user_id: session[:id])
        render :update
      end
    rescue => e
    end
  end

  def update
    begin
      @creator = Creator.find_by(user_id: session[:id])
      if @creator.update_attributes(title: params[:creator][:title], category_id: params[:creator][:category_id], establishment: params[:creator][:establishment], employee: params[:creator][:employee], postal_code: params[:creator][:postal_code], address_1: params[:creator][:address_1], address_2: params[:creator][:address_2],introduction: params[:creator][:introduction], is_recruitment: params[:creator][:is_recruitment])
        flash[:success] = "更新成功"
        redirect_to "/creator/update"
      else
        flash[:danger] = "更新失敗"
        redirect_to "/creator/update"
      end
    rescue => e

    end
  end

  def data
    if session[:creator] != nil
      @count = CreatorImage.where(user_id: session[:id]).count
      if @count > 0
        @get_image = CreatorImage.where(user_id: session[:id])
      end
      @creator_image = CreatorImage.new
      render :upload_image
    else
    end
  end

  def upload
    if session[:creator] != nil
      params[:creator_image][:user_id] = session[:id]
      @creator_image = CreatorImage.new(image_params)
      if @creator_image.save
        flash[:success] = "投稿完了"
        redirect_to "/creator/upload"
      else
        flash[:danger] = "投稿失敗"
        redirect_to "/creator/upload"
      end
    end
  end

  def delete
    @creator_image = CreatorImage.find_by(id: params[:id])
    @creator_image.destroy
    redirect_to "/creator/upload"
  end
end

private
def creator_params
  params.require(:creator).permit(:user_id, :title, :category_id, :establishment, :employee, :postal_code, :address_1, :address_2, :introduction, :is_recruitment)
end

def image_params
  params.require(:creator_image).permit(:user_id, :media_data, :created_at, :updated_at)
end
