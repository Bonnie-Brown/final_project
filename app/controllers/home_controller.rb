class HomeController < ApplicationController

    before_action :find_trip, only: [:edit, :update, :show, :destroy]

    before_action :authenticate_user!

    before_action :authorize_user!, only: [:read, :edit, :update, :destroy]

    def index
        @trips = current_user.trips.order(departure_date: :asc)
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
