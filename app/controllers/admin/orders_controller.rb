class Admin::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry

    # 支払い方法
　　if params[:order][:payment_method] == Order.payment_methods.key(0)
      @order.payment_method = Order.payment_methods_i18n[:credit_card]

    elsif params[:order][:payment_method] == Order.payment_methods.key(1)
      @order.payment_method = Order.payment_methods_i18n[:transfer]
    end

    # お届け先
    # ご自身の住所の場合
    if params[:order][:address_number] == "0"
      # @order.shipping_name = current_customer.last_name + ' ' + current_customer.first_name
      # @order.shipping_postal_code = current_customer.postal_code
      # @order.shipping_address = current_customer.address_display
      # ↑カート機能実装後、アンコメントし確認
    # 登録済み住所から選択の場合
    elsif params[:order][:address_number] == "1"
# 登録済み住所がなかった場合は？
      @order.shipping_name = Delivery_address.find(params[:order][:delivery_address_id]).addressee
      @order.shipping_postal_code = '〒' + Delivery_address.find(params[:order][:delevery_address_id]).postal_code
      @order.shipping_address = Delivery_address.find(params[:order][:delivery_address_id]).address
    # 新しいお届け先の場合
    elsif params[:order][:address_number] == "2"
      @order.shipping_name = params[:order][:shipping_name]
      @order.shipping_postal_code = '〒' + params[:order][:shipping_postal_code]
      @order.shipping_addressparams[:order][:shipping_address]
    end
    render 'confirm'

  end



  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end

