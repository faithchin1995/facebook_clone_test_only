class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.authenticate(session_params)
		if @user != nil
			session[:user_id] = @user.id
			flash[:notice] = "Welcome, #{@user.email}!"
			redirect_to statuses_path
		else
			session[:user_id] = @user
			flash[:alert] = "Please log in again"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private

	def session_params
		params.require(:session).permit(:email, :password, :password_confirmation)
	end
end