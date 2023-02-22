class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.all
    @btn = "新規登録"
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.new
    @genre = Genre.all
    @btn = "変更を保存"
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:image, :genre_id, :name, :description, :tax_excluded_price, :is_active)
  end

end
