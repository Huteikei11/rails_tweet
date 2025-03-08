class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.name = '名無し'
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "削除しました"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :content)
  end
end
