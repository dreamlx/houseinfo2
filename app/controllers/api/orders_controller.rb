class Api::OrdersController < ApplicationController
  # GET /builds
  # GET /builds.json
  respond_to :json
  def index
    @orders = Order.all if params[:user_id].blank? and params[:room_id].blank?
    @orders = Order.where("user_id = #{params[:user_id]}") unless params[:user_id].blank?
    @orders = Order.where("room_id = #{params[:room_id]}") unless params[:room_id].blank?
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
        format.json { render json: @order, status: :created}
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    order = Order.find(params[:id])
    
    Order.where(:room_id => order.room.id).each do |o|
      if o.state == "in_process"
        o.unconfirm
      end
    end
    order.room.sold
    order.confirm
    
    render json: order
  end

  def unconfirm
    order = Order.find(params[:id])
    order.unconfirm
    order.room.unsold
    render json: order
  end
end