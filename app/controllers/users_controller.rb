class UsersController < ApplicationController
	 skip_before_action :verify_authenticity_token
	
	def index
		@users =User.all
		render json: @users
	end

	def new
	end

	def create
	@user = User.create(name:  params[:name], mobile_number: params[:mobile_number])
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

end
