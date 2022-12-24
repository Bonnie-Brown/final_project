class TodoItemsController < ApplicationController

    before_action :find_todo_list
    before_action :find_trip
    before_action :find_todo_item
    # before_action :authenticate_user!

    # Create

    def create
        @todo_item = TodoItem.new(todo_item_params)
        @todo_item.todo_list = @todo_list
        # @todo_item.trip = @trip
        @todo_item.user = current_user

        if @todo_item.save
            flash[:success] = "Item has been added to the list."
            redirect_to trip_todo_list_path(@trip, @todo_list)
        else
            @todo_items = @todo_list.todo_items.order(created_at: :desc)
            render root_path, status: 303
        end
    end

    # Read

    def show
    end

    # Update

    def edit
    end

    def update
        if @todo_item.update(todo_item_params)
            flash[:success] = 'List updated!'
            redirect_to trip_todo_list_path(@trip, @todo_list)
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    # Destroy

    def destroy
      
        @todo_item.destroy
        redirect_to trip_todo_list_path(@trip, @todo_list)
 
    end

    private

    def find_trip
        @trip = Trip.find @todo_list.trip_id 
    end

    def find_todo_list
        p'******************'
        p params
        p'******************'
         @todo_list = TodoList.find params[:todo_list_id]
    end

    def find_todo_item
        @todo_item = TodoItem.find_by_id params[:id]
    end

    def todo_item_params
        params.require(:todo_item).permit(:description, :completed)
    end
end
