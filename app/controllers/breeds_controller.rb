class BreedsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update]

 
    def index
        @breeds = Breed.all 
        render json: @breeds
    end
    
end
