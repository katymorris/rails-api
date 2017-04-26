class Api::TodoItemsController < ApplicationController
	skip_before_action :verify_authenticity_token
    before_filter :find_todo_list

    def index
        render json: TodoItem.all
    end
    def show
        item = @list.todo_items.find_by(params[:id])
        render json: item
    end
    def create
    	item = @list.todo_items.new(item_params)
    	if item.save 
    		render status: 200, json: {
    			message: "Successfully created To-do list.",
    			todo_list: @list,
                todo_item: item
    		}.to_json
    	else
    		render status: 422, json: {
    			errors: item.errors
    		}
    	end
    end
    def update
    	item = @list.todo_items.find_by(params[:id])
    	if item.update(item_params)
	    	render status: 200, json: {
				message: "Successfully updated To-do item.",
				todo_list: @list,
                todo_item: item
			}.to_json
    	else
    		render status: 422, json: {
    			errors: item.errors
    		}
    	end
    end
  #   def destroy
  #   	list = TodoList.find(params["id"])
  #   	list.destroy
  #   	render status: 200, json: {
		# 	message: "Successfully deleted To-do list.",
		# 	todo_list: list
		# }.to_json
  #   end

    private
    def item_params
    	params.require("todo_item").permit("content")
    end
    def find_todo_list
        @list = TodoList.find(params[:todo_list_id])
    end

end