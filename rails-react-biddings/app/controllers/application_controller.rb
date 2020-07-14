class ApplicationController < ActionController::API
    

    include ActionController::HttpAuthentication::Token::ControllerMethods 
    end

    

    private

    def current_user 
        if session[:user_id].present?
            current_user ||= User.find(id: session[:user_id])
        end
    end

    def user_signed_in?
        current_user.present?
    end

    def authenticate_user!
        unless user_signed_in?
            render json: {status: 401, message:"User must sign in or sign up"}, status: 401
        
    end
end
