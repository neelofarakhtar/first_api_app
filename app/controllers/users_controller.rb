class UsersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	
	def index
		@users =User.all
		render json: @users
	end

	def new
	end

	def create	
	debugger
	@user = User.create(user_params)
	render json: @user
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(name: params[:name])
		render json: @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json: @user
	end

	private
	def user_params
		params.permit(:name, :mobile_number, :image)
	end
end
