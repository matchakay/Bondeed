class GmailMailer < ApplicationMailer

  def send_create(user)
    @user = user
    mail to:       user.email,
         subject:  "登録完了"
  end
end
