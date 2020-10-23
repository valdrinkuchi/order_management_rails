class ProducersController < ApplicationController
  def index
    @producers = Producer.all
  end

  def new
    @producer = Producer.new
  end

  def create
    @producer = Producer.new(producer_params)
    if @producer.save
      redirect_to producers_path, notice: 'Producer created successfully.'
    else
      redirect_to new_producer_path, notice: 'Error creating producer.'
    end
  end

  def show
    @producer = Producer.find_by_id(params[:id])
    redirect_to '/' unless @producer
  end

  def edit
    @producer = Producer.find_by_id(params[:id])
  end

  def update
    @producer = Producer.find_by_id(params[:id])
    if @producer.update(producer_params)
      redirect_to producers_path, notice: 'Producer updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @producer = Producer.find_by_id(params[:id])
    @producer.destroy
    if @producer.destroy
      redirect_to producers_path, notice: 'Producer deleted successfully.'
    else
      render 'edit'
    end
  end

  private

  def producer_params
    params.require(:producer).permit(:number, :name, :short_name, :address, :bonus)
  end
end
