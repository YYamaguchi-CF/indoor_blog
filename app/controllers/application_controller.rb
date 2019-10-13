class ApplicationController < ActionController::Base
	
	include SessionsHelper

  private
  
  def login_required
  	redirect_to root_path unless current_user
  end
end
