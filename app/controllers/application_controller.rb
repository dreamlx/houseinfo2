class ApplicationController < ActionController::Base
  protect_from_forgery
  # skip_before_filter :authenticate_user!
  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
  
  def access_denied(exception)
    redirect_to admin_dashboard_path, :alert => exception.message
  end
end
