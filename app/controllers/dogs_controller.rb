class DogsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index]
    skip_before_action :authorized, only: [:show, :update, :index, :create]

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

    private

    def dog_params
        params.required(:dog).permit(:name, :color, :specialconcerns, :rabies, :breed_id, :client_id)
    end

end
