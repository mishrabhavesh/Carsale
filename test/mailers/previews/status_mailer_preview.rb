# Preview all emails at http://localhost:3000/rails/mailers/status_mailer
class StatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/status_mailer/status_email
  def status_email
    StatusMailer.status_email
  end

end
