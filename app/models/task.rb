class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	validates :title, :due_date, :project_id, presence: true
	validates :project_id, numericality: true
	before_create :generate_api_key

end
