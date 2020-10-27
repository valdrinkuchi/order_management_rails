class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path, notice: 'Customer created successfully.'
    else
      redirect_to new_customer_path, notice: 'Error creating customer.'
    end
  end

  def show
    @customer = Customer.find(params[:id])
    redirect_to '/' unless @customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    if @customer.destroy
      redirect_to customers_path, notice: 'Customer deleted successfully.'
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:number, :name, :short_name, :address, :delivery_address, :bonus)
  end
end
