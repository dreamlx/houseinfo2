class Api::AdminUsersController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json

  def index
    @admin_users = AdminUser.all
  end

end