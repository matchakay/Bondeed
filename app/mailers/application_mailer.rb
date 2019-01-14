class ApplicationMailer < ActionMailer::Base
  default from:       'SucSeed',
          bcc:        'gmail+sent@gmail.com',
          reply_to:   'gmail+reply@gmail.com'
  layout 'mailer'
end
