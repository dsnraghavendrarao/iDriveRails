class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    	if @user.save
    		render json: { success: true, user: @user}, status: :created
    	else
      	render json: { success: false, error: @user.errors.messages }, status: :ok
    	end
  end
	
	private
	
	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
