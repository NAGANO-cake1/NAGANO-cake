class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @products_genre = Genre.find(params[:genre_id]).products
      @products = @products_genre.page(params[:page])
      @products_count = @products_genre.count
    elsif params[:search]
      @search = Product.search(params[:search])
      @products = @search.page(params[:page])
      @products_count = @products.count
    else
      @products = Product.page(params[:page]).per(8)
      @products_count = Product.count
    end

  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    @cart_item = CartItem.new
    @genres = Genre.all
  end


end
