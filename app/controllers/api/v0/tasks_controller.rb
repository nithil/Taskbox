class Api::V0::TasksController < Api::V0::ApiController
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
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
	end

	private

	def task_params
		params[:task].permit(:title, :due_date, :is_completed, :project_id)
	end
end
