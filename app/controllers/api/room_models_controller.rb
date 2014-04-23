class Api::RoomModelsController < ApplicationController
  # GET /units
  # GET /units.json
  respond_to :json
  def index
    @room_models = RoomModel.all
    render '/api/room_models/index'
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @room_model = RoomModel.find(params[:id])

    render '/api/room_models/show'
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @room_model = RoomModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_model }
    end
  end

  # GET /units/1/edit
  def edit
    @room_model = RoomModel.find(params[:id])
  end

  # POST /units
  # POST /units.json
  def create
    @room_model = RoomModel.new(params[:unit])

    respond_to do |format|
      if @room_model.save
        format.html { redirect_to @room_model, notice: 'Unit was successfully created.' }
        format.json { render json: @room_model, status: :created, location: @room_model }
      else
        format.html { render action: "new" }
        format.json { render json: @room_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @room_model = RoomModel.find(params[:id])

    respond_to do |format|
      if @room_model.update_attributes(params[:unit])
        format.html { redirect_to @room_model, notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @room_model = RoomModel.find(params[:id])
    @room_model.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end
end
