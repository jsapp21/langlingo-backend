class UsersController < ApplicationController

    # def index
    #     users = User.all 

    #     render json: users
    # end
    
    # current_user route
    # token auth - App.js
    def show
        token = request.headers[:Authorization].split(' ')[1]
        # store this in git ignore? enviroment variable
        begin
            hmac_secret = ENV['HMAC_SECRET']
            decoded_token = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
            user_id = decoded_token[0]['user_id']
            user = User.find(user_id)
            render json: user

        rescue JWT::DecodeError
            render json: { error: 'Invalid token.'}
        end

    end


    def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            # hides the user's id 
            payload = { user_id: user.id }
            hmac_secret = ENV['HMAC_SECRET']
      
            token = JWT.encode(payload, hmac_secret, 'HS256')
            # send to frontend here
            render json: { user: UserSerializer.new(user), token: token }
        else 
            render json: { error: 'Invaild username or password.' }
        end 

    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: user
        else
            render json: { error: 'Username is already taken or password does not match. Try again.' }
        end
    end


    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :language)
    end

end

# create a token & hide users_id as a token in localStorage (browsers memory)
# so the user doesn't have to sign in again

# First: our app will check for a token ? send it to BE to decrypt token & send users info to FE : send back error
# FE will store info in the store & localStorage
# on refresh it will check for tokens