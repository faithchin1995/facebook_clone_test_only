class LikesController < ApplicationController
	# before_action :find_user
	# before_action :find_status

	def create
		@like = Like.new(status_id: like_params[:status], user_id: like_params[:user])
		if @like.save
			if Like.where(status_id: like_params[:status], user_id: like_params[:user]).count > 1
				Like.where(status_id: like_params[:status], user_id: like_params[:user]).last.destroy
				flash[:alert] = "You liked before!"
				redirect_to root_path
				else
				flash[:notice] = "You liked #{@like.status.title}!"
				redirect_to root_path
			end
		end
	end

	def destroy
		@like = Like.find_by_id(params[:id])
		@status = @like.status
		@like.destroy
		flash[:notice] = "You unlike."
		redirect_to status_path(id: @status.id)
	end

	private

	def like_params
		params.require(:like).permit(:status, :user)
	end

	def find_user
		@user = User.find(session[:user_id])
	end
end