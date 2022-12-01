class TripsController < ApplicationController

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

private

def trip_params
    params.require(:trip).permit(:name, :destination)
end

end
