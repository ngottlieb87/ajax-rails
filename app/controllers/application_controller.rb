class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :admin
  helper_method :current_order
  helper_method :is_admin?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
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
    redirect_to '/sign_in' unless admin
  end
end
