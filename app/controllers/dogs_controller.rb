class DogsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index, :destroy]
    skip_before_action :authorized, only: [:show, :update, :index, :create, :destroy]

    def index
        @dogs = Dogs.all
        render json: @dogs
    end

    def create
        @dog = Dog.create(dog_params)
        if @dog.save
            render json: @dog, status: :created
          else
            render json: { error: 'failed to create dog' }, status: :not_acceptable
          end
    end

    def edit

    end

    def update

    end

    def destroy
        @dog = Dog.find_by(id: params[:id])
        @dog.destroy
    end



    private

    def dog_params
        params.required(:dog).permit(:name, :color, :specialconcerns, :rabies, :breed_id, :client_id)
    end

end
