class Enrollment < ApplicationRecord
	
	# Associations
	belongs_to :lecture
	belongs_to :user

	# Validations
	validates :lecture_id, presence: true
	validates :user_id, presence: true
end
