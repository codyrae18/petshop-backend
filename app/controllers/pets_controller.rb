class PetsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update, :show, :destroy]

    def index
        @pets = Pet.all
        render json: @pets.as_json(include: [:appointments, :services])
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
        @pet = Pet.find_by(params[:id])
    end

    def update
        @pet = Pet.find(params[:id])
           if @pet.update(pet_params)
             render json: @pet 
           end
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
