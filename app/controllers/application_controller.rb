class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :current_admin?
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_action

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  private

  # handles 404 when a record is not found.
  def rescue_action(exception)
    case exception
    when ActiveRecord::RecordNotFound, ActionController::UnknownAction, ActionController::RoutingError
      render :file => "app/views/errors/not_found.html.erb", :status => 404
    else
      super
    end
  end
end
