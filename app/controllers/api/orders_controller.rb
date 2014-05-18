class Api::OrdersController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json
  def index
    @orders = Order.all
    render '/api/orders/index'
  end

  def show
    @order = Order.find(params[:id])
    render '/api/orders/show'
  end

  # POST /units
  # POST /units.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
end