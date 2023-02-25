class Admin::OrderDetailsController < ApplicationController

  def update
    order = OrderDetail.find(params[:order_id])
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(making_status_params)

    redirect_to admin_order_path(order.id)
  end

  private

  def making_status_params
    params.require(:order_detail).permit(:making_status)
  end
end
