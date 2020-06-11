class Api::UsersController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create, :update]

    def index
        @users = User.all 
        render json: @users
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

    def show
          @user = User.find_by(id: params[:id])
          # image = rails_blob_path(@user.image)
  
          if @user.password == params[:password]
            render json: @user
          else 
            render json: {message: "this is not authenticated"}
          end
      end
  
    
    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def update
        @user = User.find(params[:id])
        render json: @user.as_json, status: 200
      end

    private

    def user_params
        params.required(:user).permit(:username, :password)
    end

    def set_user
        @user = user.find(params[:id])
    end
    
end
