class Appointment < ApplicationRecord
  belongs_to :patient
  #belongs_to :doctor
  

  #belongs_to :patient, class_name: 'Patient', foreign_key: :patient_id
end
