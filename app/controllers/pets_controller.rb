class PetsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index, :destroy]
    skip_before_action :authorized, only: [:show, :update, :index, :create, :destroy]

    def index
        @pets = Pets.all
        render json: @pets
    end

    def create
        @pet = Pet.create(pet_params)
        if @pet.save
            render json: @pet, status: :created
          else
            render json: { error: 'failed to create pet' }, status: :not_acceptable
          end
    end

    def edit

    end

    def update

    end

    def destroy
        @pet = Pet.find_by(id: params[:id])
        @pet.destroy
    end



    private

    def pet_params
        params.required(:pet).permit(:name, :color, :specialconcerns, :rabies, :breed_id, :client_id)
    end
end
