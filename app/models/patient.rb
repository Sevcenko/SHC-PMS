class Patient < ApplicationRecord
	has_many :records
	has_many :appointments
	belongs_to :doctor

	def self.search(search)
	  where("name LIKE ?", "%#{search}%")
	end
end
