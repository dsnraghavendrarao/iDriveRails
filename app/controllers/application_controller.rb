class ApplicationController < ActionController::API
	attr_reader :current_user

	def authenticate_request!
		if request.headers['HTTP_AUTHORIZATION'].present?
	    	@user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
	    	if @user.present?
	 			@current_user = @user   	
	    	else
	    		render :json=> {:success=>false, :message => ["Token Missing"] }, status: :unauthorized
	    	end
	    else
	    	render :json=> {:success=>false, :message => ["Token Missing"] }, status: :unauthorized
	    end
	end

	def decoded_auth_token
	    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
	end

	def http_auth_header
		return request.headers['HTTP_AUTHORIZATION'].split(' ').last
	end
end