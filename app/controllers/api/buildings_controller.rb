class Api::BuildingsController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json
  def index
    @buildings = Building.all

    render '/api/buildings/index'
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
    @building = Building.find(params[:id])
  end

  # GET /builds/new
  # GET /builds/new.json
  def new
    @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @building }
    end
  end

  # GET /builds/1/edit
  def edit
    @building = Building.find(params[:id])
  end

  # POST /builds
  # POST /builds.json
  def create
    @building = Building.new(params[:building])
    @rooms = @building.rooms
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Build was successfully created.' }
        format.json { render json: @building, status: :created, location: @building }
      else
        format.html { render action: "new" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /builds/1
  # PUT /builds/1.json
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to @building, notice: 'Build was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to builders_url }
      format.json { head :no_content }
    end
  end
end
