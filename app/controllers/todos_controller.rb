class TodosController < ApplicationController
	before_action :authenticate_request!
	def todos
		@todos = [{name: @current_user.first_name,status: false},{name: @current_user.first_name,status: false},{name: @current_user.first_name,status: false},{name: @current_user.first_name,status: false},{name: @current_user.first_name,status: false}]
		render json: { success: true, todos: @todos}, status: :ok
	end
end
