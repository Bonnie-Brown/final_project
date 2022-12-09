class AccommodationsController < ApplicationController

    # before_action :find_details
    before_action :authenticate_user!


    def create
        print '****** before accomodation'
        @accommodation = Accommodation.new(accommodation_params)
        print '****** after accomodation'
        # @accommodation.detail = @detail
        @accommodation.user = current_user
        if @accommodation.save
            flash[:success] = "Accommodation successfully created!"
            redirect_to @trip
        else
            # @accommodations = @trip.details.accommodations.order(created_at: :desc)
            render "/trips/:id/detail", status: 303 
        end
    end

    def destroy
        @accommodation = Accomodation.find params[:id]

        if can?(:crud, @accommodation)
            @accommodation.destroy
            redirect_to trip_path(@comment.post)
            flash[:success] = "Comment has been deleted."
        else
            redirect_to trip_detail_path, alert: "Not authorized to change comment."
        end
        
    end

    private

    # def find_details
    #     @details = Trip.find params[:trip_id]
    # end

    def accommodation_params
        params.require(:accommodation).permit(:name)
    end


end
