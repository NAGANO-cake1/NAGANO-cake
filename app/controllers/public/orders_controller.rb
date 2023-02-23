class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.total_bill_amount = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }

    # @total = @cart_items.inject(0){|sum, item| sum +@cart_item.product.with_tax_price*item.quantity}

    # binding.pry


    # お届け先
    # ご自身の住所の場合
    if params[:order][:select_address] == "0"
      @order.shipping_name = current_customer.last_name + ' ' + current_customer.first_name
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      # byebug

    # 登録済み住所から選択の場合
    elsif params[:order][:select_address] == "1"
# 登録済み住所がなかった場合は？
      @order.shipping_name = Delivery_address.find(params[:order][:delivery_address_id]).addressee
      @order.shipping_postal_code = Delivery_address.find(params[:order][:delevery_address_id]).postal_code
      @order.shipping_address = Delivery_address.find(params[:order][:delivery_address_id]).address
    # 新しいお届け先の場合
    elsif params[:order][:select_address] == "2"
      @order.shipping_name = params[:order][:shipping_name]
      @order.shipping_postal_code = params[:order][:shipping_postal_code]
      @order.shipping_address = params[:order][:shipping_address]
    end
  end

  def create
    order = current_customer.orders.new(order_params)
    cart_items = current_customer.cart_items.all
      if order.save
        cart_items.each do |cart_item|
          order_detail = OrderDetail.new
          order_detail.order_id = order.id
          order_detail.product_id = cart_item.product_id
          order_detail.purchase_price = order.total_bill_amount + order.shipping_fee
        end
        redirect_to complete_orders_path

      else
        # 保存できなかったときの処理
        @order = Order.new(order_params)
        @cart_items = current_customer.cart_items.all
        @order.total_bill_amount = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
        render 'confirm'
      end
  end

  def index
    @order= current_customer.order.all

  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_address, :shipping_name, :shipping_postal_code, :total_bill_amount)
  end

end
