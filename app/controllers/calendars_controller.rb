class CalendarsController < ApplicationController
 before_action :authenticate_user!

    def show
        @trips = Trip.all
    end

end
