class ServicesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update]


    def index
        byebug
        @services = Service.all 
        render json: @services
    end

    def create
        @service = Sevice.create(services_params)
    end

    def new
        @service = Service.new
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
        @service
    end

    def destroy

    end

    private
end
