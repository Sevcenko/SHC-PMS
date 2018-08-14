class PatientsController < ApplicationController
	before_action :must_login
	def index
		if params[:search]
			@patients = Patient.search(params[:search]).order("name")
		else	
			@patients = Patient.all
		end
	end

	def show
		@patient = Patient.find(params[:id])
	end

	def new
		@patient = Patient.new
	end

	def create
		#render plain: params[:post].inspect
		@patient = Patient.new(patient_params)
		@patient.doctor_id = session[:doctor_id]

	
		if(@patient.save)
		#sitas kasko neveikia
		 redirect_to @patient
		else 
			render 'new'
		end	
	end

	def edit
		@patient = Patient.find(params[:id])
		@patient.doctor_id = session[:doctor_id]

	end

	def update
		@patient = Patient.find(params[:id])
		@patient.doctor_id = session[:doctor_id]


		if(@patient.update(patient_params))
		#sitas kasko neveikia
		 redirect_to @patient
		else 
			render 'edit'
		end
	end

	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy

		redirect_to patients_path
	end


	private def patient_params
		params.require(:patient).permit(:name, :surname, :email, :birthday, :addressNumber, :address_street, :city, :phoneNumber, :clinic)
	end
end
