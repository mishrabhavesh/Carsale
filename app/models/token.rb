class Token < ApplicationRecord
    belongs_to :user

    after_update :set_status

    def set_status
        mail = Mail.new do
            from    'mikel@test.lindsaar.net'
            to      current_user.eamil
            subject 'This is a test email'
            body    'HELLO status updated'
          end
          
          mail.to_s
    end
end