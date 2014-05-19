class UsersController < ApplicationController
  # render the view when registering
  def new
  	@user = User.new
  end

  # method to create new user
  def create
  	@user = User.new(user_params)

    # save user data
    if @user.save
      redirect_to new_session_path
    else
      flash.keep[:error] = "Email address already taken." # check if email is already taken
      redirect_to new_user_path
    end
  end

  # show the details of the user
  def show
    if current_user
    	@user = User.find(params[:id])
    else
      @user = User.new
      flash.keep[:error] = "Invalid email/password combination."
      redirect_to action: "new"
    end
  end

  #strong parameter for users
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end