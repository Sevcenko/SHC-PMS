class SessionsController < ApplicationController
	def new

	end

	def create
		doctor = Doctor.find_by(email: params[:email])
	
		if doctor && doctor.authenticate(params[:password])
			session[:doctor_id] = doctor.id

			flash[:success] = "Welcome to rails simple auth"

			redirect_to home_path
		else
			flash.now[:danger] = "Your email or password is incorect"
			render 'new'
		end
	end

	def destroy
		session[:doctor_id] = nil
		flash[:success] = "Good bye"
		redirect_to login_path
	end
end
