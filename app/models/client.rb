class Client < ActiveRecord::Base
	has_many :projects
	validates :name, :mobile, :email, :website, presence: true
	validates_length_of :mobile, is:10
	validates :email, email_format: { message: "doesn't look like an email address" }
	# validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
