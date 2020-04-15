class StatusMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.status_mailer.status_email.subject
  #
  default from: "mishra.bhavesh@outlook.com"

  def status_email(user)
   mail(to: "<#{user.email}>", subject: "Status changed")
  end
end
