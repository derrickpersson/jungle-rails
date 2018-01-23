class SessionsController < ApplicationController
  def new
  end

  def create
    # Retrieve the user information.
    # @user = User.find_by_email(params[:email])
    # If user exists & the password matches
    # if @user && @user.authenticate(params[:password])
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # Set a session with that users' id
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

# Set session to nil to log out.
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
