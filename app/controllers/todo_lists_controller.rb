class TodoListsController < ApplicationController

    before_action :find_todo_list, only: [:edit, :update, :show, :destroy]

    def new
        @todo_list = TodoList.new
         @trip = Trip.find(params[:trip_id])
    end

    def create

        @todo_list = TodoList.new(todo_list_params)
        

        if @todo_list.save
            flash[:success] = "List saved!"
            redirect to @todo_list
        else
            render 'new', status: 303
        end
    end

    def index
        @trip = Trip.find params[:trip_id]
        @todo_lists = @trip.todo_lists.order(created_at: :desc)
        
    end

    def show
        @todo_list_items = @todo_list.todo_list_items.order(created_at: :desc)
        @todo_list_item = TodoList_item.new
    end

    def edit
    end

    def update
        if @todo_list.update(todo_list_params)
            flash[:success] = 'List updated!'
        else
            flash[:error] = "Something went wrong"
            render 'edit'
        end
    end

    def destroy
        @todo_list.destroy
        flash[:success] = 'List deleted.'
        redirect_to root_path
    end

    private

    def find_todo_list
        @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
        params.require(:todo_list).permit(:description)
    end
end
