class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    respond_to do |format|
      format.json { render json: @brands.to_json }
      format.html
    end
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brands_path, notice: 'Brand created successfully.'
    else
      redirect_to new_brand_path, notice: 'Error creating brand.'
    end
  end

  def show
    @brand = Brand.find_by_id(params[:id])
    redirect_to '/' unless @brand
  end

  def edit
    @brand = Brand.find_by_id(params[:id])
  end

  def update
    @brand = Brand.find_by_id(params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path, notice: 'Brand updated successfully.'
    else
      render 'edit'
    end
  end

  def destroy
    @brand = Brand.find_by_id(params[:id])
    @brand.destroy
    if @brand.destroy
      redirect_to brands_path, notice: 'Brand deleted successfully.'
    else
      render 'edit'
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :customer_id)
  end
end
