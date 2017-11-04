class Api::V0::ApiController < ApplicationController
	skip_before_action :verify_authenticity_token

	rescue_from ActiveRecord::RecordNotFound do
		render 'record.json'
	end

	def check_api_key
		if params[:api_key]
			@user = User.find_by(api_key: params[:api_key])
			if @user.nil?
				render '/api/v0/sessions/invalid.json'
			else
				return @user
			end
		else
			render '/api/v0/sessions/alert.json'
		end
	end
end