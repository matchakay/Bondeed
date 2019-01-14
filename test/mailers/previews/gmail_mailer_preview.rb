# Preview all emails at http://localhost:3000/rails/mailers/gmail_mailer
class GmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/gmail_mailer/send_update
  def send_update
    GmailMailer.send_update
  end

end
