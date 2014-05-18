class Api::AdminUsersController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json
  def index
    @admin_users = AdminUser.all
    render '/api/admin_users/index'
  end

  def show
    @admin_user = AdminUser.find(params[:id])
    render '/api/admin_users/show'
  end
end