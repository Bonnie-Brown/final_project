class AccommodationsController < ApplicationController

    before_action :find_trip
    before_action :find_accommodation, only: [:show]
    
    before_action :authenticate_user!

   #Create

   def new
    @accommodation = Accommodation.new
   end

   def create

    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.trip = @trip
    @accommodation.user = current_user

    if @accommodation.save
        flash[:success] = "Comment successfully created!"
        redirect_to trip_accommodations_path
    else
        
        render @trip, status: 303 
    end

   end

   #Read

   def index
    @accommodations = @trip.accommodations.order(created_at: :desc)
   end

   def show

    # @trip = @accommodation.trip
   
    

   end

   #Destroy

   def destroy
   end

       private

    def find_trip
        @trip = Trip.find params[:trip_id] 

    end

    def find_accommodation
         @accommodation = Accommodation.find_by_id params[:id]
    end


    def accommodation_params
        params.require(:accommodation).permit(:name, :address, :phone, :email, :check_in_date, :check_out_date, :check_in_time, :check_out_time, :note)
    end

end
