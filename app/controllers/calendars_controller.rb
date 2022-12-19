class CalendarsController < ApplicationController
 before_action :authenticate_user!

    def show

        @trips = Trip.where(
            departure_date: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
        )
    end

end
