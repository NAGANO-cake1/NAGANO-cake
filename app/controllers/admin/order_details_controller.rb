class Admin::OrderDetailsController < ApplicationController

  def update
    order = Order.find(params[:order_id])
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(making_status_params)


    if order_detail.making_status == OrderDetail.making_statuses.key(2)
      order.order_status = Order.order_statuses.key(2)
      order.save
    end




    redirect_to admin_order_path(order.id)


  end

  private

  def making_status_params
    params.require(:order_detail).permit(:making_status)
  end
end
