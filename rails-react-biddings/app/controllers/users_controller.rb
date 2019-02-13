class UsersController < ApiController
    before_action :require_login, except: [:create]


  

    def index
        @user = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        render json: { token: user.auth_token }
    end


    def profile 
        user = User.find_by_auth_token!(request_headers[:token])
        render json: { user: { username: user.username, email: user.email, name: user.name } }
    end




    private

    def user_params
        params.permit(:user).permit(:username, :email, :password, :name)
    end
end
