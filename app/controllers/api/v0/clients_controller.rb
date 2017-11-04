class Api::V0::ClientsController < Api::V0::ApiController
	before_action :check_api_key
	before_action :set_task, only: [:show, :update, :destroy]
	def index
		@clients = @user.clients
	end

	def create
		@client = Client.new(client_params)
		@client.user_id = @user.id
		if @client.save
			render 'create.json'
		else
			render 'errors.json'
		end
	end

	def update
		if @client.update_attributes(client_params)
			render 'update.json'
		else
			render 'errors.json'
		end
	end

	def show
	end

	def destroy
		@client.destroy
	end

	private

	def set_task
		@task = @user.tasks.find(params[:id])
	end

	def client_params
		params[:client].permit(:name, :mobile, :email, :website)
	end

end
