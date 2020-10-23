class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path, notice: 'Order created successfully.'
    else
      redirect_to new_order_path, notice: 'Error creating order.'
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
    redirect_to '/' unless @order
  end

  def edit
    @order = Order.find_by_id(params[:id])
  end

  def update
    @order = Order.find_by_id(params[:id])
    if @order.update(order_params)
      redirect_to orders_path, notice: 'Order updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find_by_id(params[:id])
    @order.destroy
    if @order.destroy
      redirect_to orders_path, notice: 'Order deleted successfully.'
    else
      render 'edit'
    end
  end

  private

  def order_params
    params.require(:order).permit(:number, :count, :customer_id, :brand_id, :price, :signed, :due, :in_production)
  end
end
