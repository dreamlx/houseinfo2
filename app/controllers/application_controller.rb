class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :authenticate_user!
end
