class Public::ProductsController < ApplicationController
  def index
   # @products = Product.all
    @products = Product.page(params[:page])
    @quantity = Product.count
    @genres = Genre.all

  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def search
    @genre = Genre.find_by(name: params[:genre_name])
    @products = Product.where(genre_id: @genre.id).page(params[:page]).per(8)
    @quantity = @products.size
    @genres = Genre.all
    render 'public/products/index'
  end
end
