class UsersController < ApplicationController

    # Callbacks

    before_action :find_user, only: [:edit, :update]

    # Actions


    # New

        def new
            @user = User.new
        end

        def create
            @user = User.new params.require(:user).permit(
                :first_name,
                :last_name,
                :email,
                :password,
                :password_confirmation
            )

            if @user.save
                session[:user_id] = @user.id
                flash.notice = "Signed Up!"
                redirect_to root_path
            else
                render :new, status: 303
            end
        end

    # Update

        def edit
        end

        def update
            
            if @user.update(user_params)
                flash[:success] = "Profile successfully updated."
                redirect_to root_path 
            else
                redirect_to users_path
                flash[:error] = "Something went wrong."
            end
        end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

end
