class User < ApplicationRecord
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index, :show, :destroy]
    skip_before_action :authorized, only: [:show, :update, :index, :create, :destroy]
   
    def index
        @users = User.all
        render json: @users
    end

    def new
        @user = User.new
    end

    def create
        byebug
        @user = User.new(user_params)
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end