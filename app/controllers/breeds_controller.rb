class BreedsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index]
    skip_before_action :authorized, only: [:show, :update, :index, :create]
   
    def index
        @breeds = Breed.all 
        render json: @breeds
    end
end
