class Api::RoomsController < ApplicationController
  respond_to :json
  def index
    @rooms = Room.all
    render '/api/rooms/index'
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @room = Room.find(params[:id])

    render '/api/rooms/show'
  end
end