class UsersController < ApplicationController

    def show
        token = request.headers[:Authorization].split(' ')[1]

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

            payload = { user_id: user.id }
            hmac_secret = ENV['HMAC_SECRET']
            token = JWT.encode(payload, hmac_secret, 'HS256')

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
