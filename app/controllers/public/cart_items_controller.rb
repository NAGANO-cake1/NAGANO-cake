class Public::CartItemsController < ApplicationController
    
def index
    @cart_items=current_customer.cart_items.all
    @price_all=@cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to index
    
end

def create
     if CartItem.find_by(product_id: params[:cart_item][:product_id], customer_id: params[:cart_item][:customer_id]).present?
          cart_item = CartItem.find_by(product_id: params[:cart_item][:product_id], customer_id: params[:cart_item][:customer_id])
          cart_item.quantity += params[:cart_item][:quantity].to_i
          cart_item.update
     else
          cart_item = CartItem.new(cart_item_params)
          cart_item.save
     end
     redirect_to index
end

def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to index
end

def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to index
end


private

  def cart_item_params
      params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
  end

end


