class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_doctor, :logged_in?

  def current_doctor
  	@current_doctor ||= Doctor.find(session[:doctor_id]) if session[:doctor_id]
  end

  def logged_in?
  	!!current_doctor
  end

  def must_login
  	if !logged_in?
  		flash[:danger] = "Please login..."
  		redirect_to login_path
  	end
  end
end
