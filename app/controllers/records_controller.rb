class RecordsController < ApplicationController
	before_action :must_login
	def create
		@patient = Patient.find(params[:patient_id])
		@record = @patient.records.create(record_params)
		redirect_to patient_path(@patient)
	end

	def destroy
		@patient = Patient.find(params[:patient_id])
		@record = @patient.records.find(params[:id])
		@record.destroy
		redirect_to patient_path(@patient)
	end

	private def record_params 
		params.require(:record).permit(:doctor, :reason, :diagnosis)
	end
end
