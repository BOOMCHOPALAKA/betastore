class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

protected

  helper_method :logged_in?
  def logged_in?
    session[:user_id].present?
  end

  helper_method def current_customer
    if logged_in?
      @current_customer ||= Customer.find(session[:user_id])
    end
  end

  def set_current_customer(customer=nil)
    session[:customer_id] = customer.try(:id)
  end

  def cart
    session[:cart] ||= Hash.new(0)
  end

end
