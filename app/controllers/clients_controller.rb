class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => [:new, :create, :index, :show]
    skip_before_action :authorized, only: [:show, :update, :index, :create]

    def index
        @clients = Client.all 
        render json: @clients
    end

    def show
        @client = Client.find_by(id: params[:id])
        render json: @client.dogs
    end

    def new
        byebug

    end

    def create
        @client = Client.create(client_params)
        
        if @client.save
            render json: @client, status: :created, location: @client
        # else
            # render json: @client.errors, status: :unprocessable_entity
        end
    end
    
    private
    
    def client_params
        params.require(:client).permit(:lastname, :firstname, :homephone, :workphone)
    end
end
