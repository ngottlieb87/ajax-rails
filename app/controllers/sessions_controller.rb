class SessionsController < ApplicationController

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      respond_to do |format|
          format.html { redirect_to '/sigin' }
          format.js
        end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to '/'
  end

end
