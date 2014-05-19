class SessionsController < ApplicationController
  def new
  end

  # create a new session when logging in
  def create
  	user = User.authenticate(params[:session][:email], params[:session][:password])

    #if email and password doesn't match
  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination."
  		render :new
  	else
  		sign_in user
  		redirect_to new_item_path
  	end

  end

  # destroy session
  def destroy
  	sign_out
  	redirect_to new_session_path
  end


end
