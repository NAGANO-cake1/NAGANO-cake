class Public::CartItemsController < ApplicationController

def index
    @cart_items=current_customer.cart_items.all
    @price_all=@cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
end

def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path

end

def create
   # product_id = cart_item_params[:product_id]
    #customer_id = cart_item_params[:customer_id]
     if CartItem.find_by(product_id: params[:cart_item][:product_id], customer_id: params[:cart_item][:customer_id]).present?
          cart_item = CartItem.find_by(product_id: params[:cart_item][:product_id], customer_id: params[:cart_item][:customer_id])
         cart_item.quantity += params[:cart_item][:quantity].to_i
          cart_item.update_attribute(:quantity,cart_item.quantity)
     else
          cart_item = CartItem.new(cart_item_params)
          cart_item.save
     end
     redirect_to  cart_items_path
end

def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to  cart_items_path
end

def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to  cart_items_path
end


private

  def cart_item_params
      params.require(:cart_item).permit(:product_id, :customer_id, :quantity)
  end

end


