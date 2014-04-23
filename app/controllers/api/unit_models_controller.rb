class Api::UnitModelsController < ApplicationController
  # GET /units
  # GET /units.json
  def index
    @unit_models = UnitModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unit_models }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit_model = UnitModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit_model }
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit_model = UnitModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit_model }
    end
  end

  # GET /units/1/edit
  def edit
    @unit_model = UnitModel.find(params[:id])
  end

  # POST /units
  # POST /units.json
  def create
    @unit_model = UnitModel.new(params[:unit])

    respond_to do |format|
      if @unit_model.save
        format.html { redirect_to @unit_model, notice: 'Unit was successfully created.' }
        format.json { render json: @unit_model, status: :created, location: @unit_model }
      else
        format.html { render action: "new" }
        format.json { render json: @unit_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @unit_model = UnitModel.find(params[:id])

    respond_to do |format|
      if @unit_model.update_attributes(params[:unit])
        format.html { redirect_to @unit_model, notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit_model = UnitModel.find(params[:id])
    @unit_model.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.json { head :no_content }
    end
  end
end
