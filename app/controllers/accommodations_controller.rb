class AccommodationsController < ApplicationController

    before_action :find_trip
    before_action :find_accommodation, only: [:show, :update, :destroy]
    
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

   def edit
   end

   def update
  
        if @accommodation.update(accommodation_params)
            flash[:success] = "Successfully updated!"
            redirect_to @accommodation
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
   end


   #Destroy

   def destroy

    @accommodation.destroy
    flash[:success] = "Successfully deleted."
    redirect_to trip_accommodations_path

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
