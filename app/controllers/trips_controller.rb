class TripsController < ApplicationController

    before_action :find_trip, only: [:edit, :update, :show, :destroy]

    before_action :authenticate_user!

    before_action :authorize_user!, only: [:read, :edit, :update, :destroy]

    # Create

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(trip_params)
        @trip.user = current_user

        if @trip.save 
            flash[:success] = "Trip successfully created!"
            redirect_to @trip
        else
            flash[:error] = "Something went wrong"
            render 'new', status: 303
        end
    end

    # Read

    def index
        @trips = current_user.trips.order(departure_date: :asc)
    end

    def show
        

    end

    # Update

    def edit
    end

    def update
        if @trip.update(trip_params)
            flash[:success] = "Trip successfully updated!"
            redirect_to @trip
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    # Delete

    def destroy
        @trip.destroy
        flash[:success] = "Post successfully deleted."
        redirect_to root_path
    end

    private

    def find_trip
        @trip = Trip.find params[:id]
    end

    def trip_params
        params.require(:trip).permit(:name, :destination, :departure_date, :return_date, :image_url)
    end

    def authorize_user!
        redirect_to root_path, alert: "Not authorized to change post." unless can?(:crud, @trip)
    end

end
