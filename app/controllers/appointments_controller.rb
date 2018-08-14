class AppointmentsController < ApplicationController
	before_action :must_login

	def index
			@search = Appointment.search(params[:q])
			@appointment = @search.result

			if params[:q]
				@appointment = @search.result
			else
				@appointment = Appointment.where('DATE(date) = ?', Date.today)
			end
	end

	def search
		index
		render :index
	end

	def create
		@patient = Patient.find(params[:patient_id])
		
		@appointment = @patient.appointments.create(appointment_params)
		@appointment.doctor_id = session[:doctor_id]
		redirect_to patient_path(@patient)
	end

	def destroy
		@patient = Patient.find(params[:patient_id])
		@appointment = @patient.appointments.find(params[:id])
		@appointment.destroy
		redirect_to patient_path(@patient)


	end

	private def appointment_params 
		params.require(:appointment).permit(:date, :hours, :minutes, :appointmentType, :description)
	end
end