class Api::V0::TasksController < Api::V0::ApiController
	before_action :check_api_key
	before_action :set_task, only: [:show, :update, :destroy]
	def index
		@tasks = Task.all
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			render 'create.json'
		else
			render 'errors.json'
		end
	end

	def update
		if @task.update_attributes(task_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def show
	end

	def destroy
		@task.destroy
	end

	private

	def set_task
		@task = @user.tasks.find(params[:id])
	end
	def task_params
		params[:task].permit(:title, :due_date, :is_completed, :project_id)
	end
end
