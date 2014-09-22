class UsersController < ApplicationController
	layout 'landing'
	def index
		@user = User.all
	  if @user.count > 0
	     flash[:notice] = "users display successfully."
	  else
	    flash[:alert] = "Sorry, there were no users to
	    display."
      end 
	end

	def create
		@user = User.new(users_params)
		@user.save
		redirect_to user_path(@user)
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "user deleted!"
		else
			flash[:alert] = "There was a problem deleting the user."
		end
		redirect_to users_path
	end

	def users_params
		params.require(:user).permit(:fullname, :username, :email)
	end
end