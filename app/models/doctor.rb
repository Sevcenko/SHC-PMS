class Doctor < ApplicationRecord
	#cia reikes paziureti kaip pagrazinti sita
	#has_secure_password
	has_many :patients
	#has_many :appointments

#cia veliau reikes dadeti visokiu validation
 # validates :password,
  #  presence: { on: :create },
  #  length: { minimum: 8, allow_blank: true }
end

