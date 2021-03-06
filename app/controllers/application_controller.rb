class ApplicationController < ActionController::API
    require "google/cloud/translate"
    require "google/cloud/text_to_speech"

    def issue_token(user)
        JWT.encode({user_id: user.id}, ENV['secret_key'], 'HS256')
    end
    
    def current_user
        @user ||= User.find_by(id: user_id)
    end
    
    def token
        request.headers['Authorization']
    end
    
    def decoded_token
        begin
          JWT.decode(token, ENV['secret_key'], true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
          [{}]
        end
    end
    
    def user_id
        decoded_token.first['user_id']
    end
    
    def logged_in?
        !!current_user
    end

end
