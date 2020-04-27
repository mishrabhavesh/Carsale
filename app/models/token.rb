class Token < ApplicationRecord
  belongs_to :user
  validates :phoneno, presence: true , length: {minimum:10, maximum:12}
  after_update  :send_email

  def send_email
    StatusMailer.status_email(self.user).deliver
  end
end