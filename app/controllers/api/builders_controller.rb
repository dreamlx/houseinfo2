class Api::BuildersController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json
  def index
    @builders = Builder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @builders }
    end
  end

  # GET /builds/1
  # GET /builds/1.json
  def show
    @builder = Builder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @builder }
    end
  end

  # GET /builds/new
  # GET /builds/new.json
  def new
    @builder = Builder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @builder }
    end
  end

  # GET /builds/1/edit
  def edit
    @builder = Builder.find(params[:id])
  end

  # POST /builds
  # POST /builds.json
  def create
    @builder = Builder.new(params[:builder])

    respond_to do |format|
      if @builder.save
        format.html { redirect_to @builder, notice: 'Build was successfully created.' }
        format.json { render json: @builder, status: :created, location: @builder }
      else
        format.html { render action: "new" }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /builds/1
  # PUT /builds/1.json
  def update
    @builder = Builder.find(params[:id])

    respond_to do |format|
      if @builder.update_attributes(params[:builder])
        format.html { redirect_to @builder, notice: 'Build was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /builds/1
  # DELETE /builds/1.json
  def destroy
    @builder = Builder.find(params[:id])
    @builder.destroy

    respond_to do |format|
      format.html { redirect_to builders_url }
      format.json { head :no_content }
    end
  end
end
