class TripsController < ApplicationController

    before_action :find_trip, only: [:edit, :update, :show, :destroy]

    # Create

    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.new(params[trip_params])

        if trip.save 
            flash[:success] = "Trip successfully created!"
            redirect_to @trip
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    # Read

    def index
        @trips = Trip.order(created_at: :desc)
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
    params.require(:trip).permit(:name, :destination)
end

end
