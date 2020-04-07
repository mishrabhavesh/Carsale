class Token < ApplicationRecord
    belongs_to :user

    after_update  :send_email

    def send_email
        StatusMailer.status_email(self.user).deliver
    end
end