module DeviseWhitelist
    extend ActiveSupport::Concern
    
    included do
        before_action :name_and_phoneno, if: :devise_controller?
    end
        def name_and_phoneno
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_no])
          devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_no])
        end
end