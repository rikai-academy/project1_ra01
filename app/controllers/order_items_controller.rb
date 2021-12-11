class OrderItemsController < ApplicationController
  include CurrentOrder
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:create]


  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @order_item = @order.add_product(product)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item.order, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(session[:order_id])
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_path(@order), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end
end
