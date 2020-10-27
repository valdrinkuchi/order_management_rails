class ProductionsController < ApplicationController
  def index
    @productions = Production.all
  end

  def new
    @production = Production.new
  end

  def create
    @production = Production.new(production_params)
    if @production.save
      redirect_to productions_path, notice: 'Production created successfully.'
    else
      redirect_to new_production_path, notice: 'Error creating production.'
    end
  end

  def show
    @production = Production.find(params[:id])
    redirect_to '/' unless @production
  end

  def edit
    @production = Production.find(params[:id])
  end

  def update
    @production = Production.find(params[:id])
    if @production.update(production_params)
      redirect_to productions_path, notice: 'Production updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @production = Production.find(params[:id])
    @production.destroy
    if @production.destroy
      redirect_to productions_path, notice: 'Production deleted successfully.'
    else
      render 'edit'
    end
  end

  private

  def production_params
    params.require(:production).permit(:order_id, :producer_id, :load_count, :load_date, :bonus, :price)
  end
end
