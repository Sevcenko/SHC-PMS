class AppointmentsController < ApplicationController
	before_action :must_login

	#def index
		#@appointment = Appointment.all
		#@appointment = Appointment.where('DATE(date) = ?', Date.today)
		
		#sita gera
		#@appointment = Appointment.where('DATE(date) = ?', Date.today)
		

		#@appointment = Appointment.where("date = ?", "#{params[:appointmentType]}%")
	#end

	def index
			@search = Appointment.search(params[:q])
			@appointment = @search.result

			if params[:q]
				@appointment = @search.result
			else
				@appointment = Appointment.where('DATE(date) = ?', Date.today)
			end
		

		##if params[:search]
			#@appointment = Appointment.where(:date => params[:search])

			#selected_date = params[:search]
			# This will look for records on the given date between 00:00:00 and 23:59:59
			#@appointment = Appointment.where(:date => selected_date)


			#@appointment = Appointment.where('date = ?', params.require(:search)).order("hours")
			##@appointment = Appointment.where('date = ?', params[:search]).order("hours")
			#@appointment = Appointment.where('CAST(date AS text) LIKE ?', params[:search]).order("hours")
			#q = Date.strptime(params[:query], '%Y-%m-%d') unless params[:query].blank?
		##else	
			##@appointment = Appointment.where('DATE(date) = ?', Date.today)
		##end
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