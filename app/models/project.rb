class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :client
	has_many :tasks
	validates :name, :client_id, :start_date, :end_date, presence: true
	validates :client_id, numericality: true
	validate :check_date

	private

	def check_date
		if self.end_date < self.start_date
			self.errors.add(:errors, "end_date can't be less than start date")
			# errors[:end_date] << "can't be less than start date"
		end
	end
end
