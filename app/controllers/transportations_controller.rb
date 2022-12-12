class TransportationsController < ApplicationController
    before_action :find_trip
    before_action :find_transportation, only: [:show, :edit, :update,:destroy]
    
    before_action :authenticate_user!

    # Create

    def new
        @transportation = Transportation.new
    end

    def create
        @transportation = Transportation.new(transportation_params)
        @transportation.trip = @trip
        @transportation.user = current_user

        if @transportation.save
            flash[:success] = "Successfully created!"
            redirect_to trip_transportations_path
        else
            render @trip, status: 303 
        end
    end

    # Read

    def index
        @transportations = @trip.transportations.order(created_at: :desc)
    end

   def show

   end

   # Update

   def edit
    p '**************'
    p 'transportation controller edit'
    p @transportation
    p '**************'
   end

   def update

    p '**************'
    p 'transportation controller update'
    p '**************'


        if @transportation.update(transportation_params)
            flash[:success] = "Successfully updated!"
            redirect_to trip_transportation_path
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
   end

   # Delete

   def destroy

        @transportation.destroy
        flash[:success] = "Successfully deleted."
        redirect_to trip_transportations_path

   end

   private

    def find_trip
        @trip = Trip.find params[:trip_id] 
    end

    def find_transportation
        @transportation = Transportation.find params[:id]
        p '**************'
        p 'transportation controller find'
        p @transportation
        p '**************'
    end

    def transportation_params
        params.require(:transportation).permit(:company_name, :departure_date, :check_in_time, :arrival_time, :note)
    end

end
