class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_status_params)

    if order.order_status == Order.order_statuses.key(1)
      order_details = OrderDetail.where(params[:order_id])
        order_details.each do |order_detail|
          order_detail.making_status = OrderDetail.making_statuses.key(1)
          order_detail.save
        end
    end
    redirect_to admin_order_path(order.id)

  end

  private

  def order_status_params
    params.require(:order).permit(:order_status)
  end

end

