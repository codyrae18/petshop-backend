class ClientsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update, :show, :destroy]


    def index
        @clients = Client.all 
        render json: @clients
    end

    def show
        @client = Client.find_by(id: params[:id])
        render json: @client.pets
    end

    def new
        byebug

    end

    def create
        @client = Client.create(client_params)
        
        if @client.save
            render json: @client, status: :created, location: @client
        else
            render json: @client.errors, status: :unprocessable_entity
        end
    end

    def edit
        @client = Client.find_by(params[:id])
    end

    def update
        @client = Client.find(params[:id])
           if @client.update(client_params)
             render json: @client 
           end
    end

    def destroy
        @client = Client.find_by(id: params[:id])
        @client.destroy
    end

    
    private
    
    def client_params
        params.require(:client).permit(:lastname, :firstname, :homephone, :workphone)
    end
end
