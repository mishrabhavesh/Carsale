class BuyerMailer < ApplicationMailer
	 default from: "mishra.bhavesh@outlook.com"

  def approve(user)
   mail(to: "<#{user}>", subject: "Admin approved your car purchase")
  end

  def reject(user)
   mail(to: "<#{user}>", subject: "Admin Rejected your car purchase")
  end

end
