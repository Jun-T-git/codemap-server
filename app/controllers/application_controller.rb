
class ApplicationController < ActionController::API
        skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false
        include DeviseTokenAuth::Concerns::SetUserByToken
end