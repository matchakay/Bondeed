class InquiryController < ApplicationController
  def input_page
    @inquiry = Inquiry.new
    render :'inquiry/input_page'
  end

  def send_inquiry
    if session[:id] != nil
      params[:inquiry][:user_id] = session[:id]
    else
      params[:inquiry][:user_id] = nil
    end
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:success] = "お問い合わせありがとうございます"
      render :'inquiry/input_page'
    else
      render :'inquiry/input_page'
    end
  end
end

private
def inquiry_params
  params.require(:inquiry).permit(:inquiry_category_id, :content)
end