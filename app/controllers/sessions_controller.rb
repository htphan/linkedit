class SessionsController < ApplicationController

	def login
		@path = users_path
		render :login
	end

	def create
		@user = User.find_by(email: params[:email])
		passhash = Digest::SHA1.hexdigest(params[:password])

		if @user && @user.password == passhash
			session[:user_id] = @user.id
		else
			flash[:error] = "No user found with that email and password!"
		end
		redirect_to :root
	end

	def destroy
		session.delete(:user_id)
	end
	
end