class Api::V0::ProjectsController < Api::V0::ApiController
	before_action :check_api_key
	before_action :set_task, only: [:show, :update, :destroy]
	def index
		@projects = Project.all
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			render 'create.json'
		else
			render 'errors.json'
		end
	end

	def update
		if @project.update_attributes(project_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def show 
	end

	def destroy
		@project.destroy
	end

	private

	def set_task
		@task = @user.tasks.find(params[:id])
	end

	def project_params
		params[:project].permit(:name, :client_id, :start_date, :end_date)
	end
end
