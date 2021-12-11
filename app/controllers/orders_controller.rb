class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy if @order.id == session[:order_id]
    session[:order_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.fetch(:order, {})
  end

  def invalid_order
    logger.error "Attempt to access invalid order #{params[:id]}"
    redirect_to root_path, notice: "That order doesn't exist"
  end
end
