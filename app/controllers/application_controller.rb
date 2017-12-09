class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_order
  helper_method :is_admin?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def is_admin?
    current_user && current_user.admin
  end

  # def current_order
  #   session[:order_id] ? Order.find(session[:order_id]) : Order.new
  # end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def authorize
    if !current_user
      flash[:alert] = 'Please Sign In To View Product'
      redirect_to products_path
    end
  end

  def authorize_admin
    if !current_user.admin
      flash[:alert] = 'You are not an Admin!'
      redirect_to products_path
    end
  end
end
