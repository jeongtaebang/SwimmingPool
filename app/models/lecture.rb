class Lecture < ApplicationRecord

	# Associations
	has_many :enrollments, dependent: :destroy
	has_many :users, through: :enrollments

	# Validations
	validates :subject, presence: true
	validates :teacher, presence: true
	validates :timeinfo, presence: true
	validates :content, presence: true, length: { maximum: 140 }
end
