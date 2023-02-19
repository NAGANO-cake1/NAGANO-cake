class Admin::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genre = Genre.all
    @btn = "商品登録"
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path(@product)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
    @product = Product.new
    @genre = Genre.all
    @btn = "編集を保存"
  end

  def update
  end
end
