class AppointmentsController < ApplicationController
    # skip_before_action :verify_authenticity_token, :only => [:new, :create, :index, :edit, :update, :destroy]
    skip_before_action :authorized, only: [:show, :update, :index, :create, :destroy, :edit]
   
    def index
        @appointments = Appointment.all 
        render json: @appointments
    end
   
    def create
        byebug
        @appointment = Appointment.create(appointment_params)

        if @appointment.save
            render json: @appointment, status: :created
          else
            render json: { error: 'failed to create pet' }, status: :not_acceptable
        end
    end

    def new

    end


    def edit
        @appointment = Appointment.find_by(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        @appointment.toggle(:finish)

        if @appointment.update(appointment_params)
            render json: @appointment 
        end
    end

    def destroy

    end

    private
    
    def appointment_params
        params.required(:appointment).permit(:pet_id, :service_id, :date)
    end
end

