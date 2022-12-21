class TodoListsController < ApplicationController

    before_action :find_trip
    before_action :find_todo_list, only: [:edit, :update, :show, :destroy]
    before_action :authenticate_user!

    # Create

    def new
        @todo_list = TodoList.new
    end

    def create

        @todo_list = TodoList.new(todo_list_params)
        @todo_list.trip = @trip
        @todo_list.user = current_user
        

        if @todo_list.save
            flash[:success] = "List saved!"
            redirect_to trip_todo_lists_path
        else
            render @trip, status: 303
        end
    end

    # Read

    def index
       
        @todo_lists = @trip.todo_lists.order(created_at: :desc)
        
    end

    def show
        @todo_items = @todo_list.todo_items.order(updated_at: :desc)
        @todo_item = TodoItem.new
        
    end

    # Update

    def edit
    end

    def update
        if @todo_list.update(todo_list_params)
            flash[:success] = 'List updated!'
            redirect_to trip_todo_list_path
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    # Destroy

    def destroy
        @todo_list.destroy
        flash[:success] = 'List deleted.'
        redirect_to root_path
    end

    private

    def find_trip
        @trip = Trip.find params[:trip_id] 

    end

    def find_todo_list
        @todo_list = TodoList.find_by_id params[:id]
    end

    def todo_list_params
        params.require(:todo_list).permit(:description)
    end
end
