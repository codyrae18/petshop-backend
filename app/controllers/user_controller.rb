class UserController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index]
    skip_before_action :authorized, only: [:show, :update, :index, :create]

    def index
        @users = User.all 
        render json: @users
    end

    def new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: @user.as_json, jwt: @token }, status: :created
          else
            render json: { error: 'failed to create user' }, status: :not_acceptable
          end
    end

    private

    def user_params
        byebug
        params.required(:user).permit(:username, :password_digest)
    end
end
