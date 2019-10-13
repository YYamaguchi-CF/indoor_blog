module SessionsHelper
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	def login?
		!!current_user
	end
end
