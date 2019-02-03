class AuthenticationController < ApplicationController
 	# skip_before_action :authenticate_request!
 	def login
        user = User.find_by_email(params[:email])
        if user 
        	if user.authenticate(params[:password])
      	  		auth_token = jwt_authentnication(user)
      	  		render json: { success: true, user: user, auth_token:auth_token}, status: :ok
      	  	else
      	  		render json: { success: false, message: ["Invalid credentials."] }, status: 400
      	  	end
        else
      	  render json: { success: false, message: ["Email Not Registered with us."] }, status: 400
        end
 	end
 	
 	private
 	def jwt_authentnication(user)
 		return JsonWebToken.encode(user_id: user.id)
 	end
end
  