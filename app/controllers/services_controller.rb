class ServicesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :update, :destroy]


    def index
        @services = Service.all 
        render json: @services
    end

    def create
        byebug
        @service = Service.create(service_params)

        if @service.save
            render json: @service, status: :created
          else
            render json: { error: 'failed to create service' }, status: :not_acceptable
        end
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
        @service = Service.find_by(id: params[:id])
        @service.destroy
    end

    private

    def service_params
        params.required(:service).permit(:name)
    end
    
end
