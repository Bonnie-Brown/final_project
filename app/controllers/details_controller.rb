class DetailsController < ApplicationController



    def show

      
    end

    def index

        # p '******'
        # p Trip.find params[:trip_id]
        # p '******'  
        @trip = Trip.find params[:trip_id]
        # @accommodations = @trip.accommodations
        # @accommodation = Accommodation.new 

        # @trip = @detail.trip
        @details = @trip.details
        # @accomodations = @details.accomodations


    end



end
