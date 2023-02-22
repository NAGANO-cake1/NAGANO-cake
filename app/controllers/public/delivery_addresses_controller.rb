class Public::DeliveryAddressesController < ApplicationController
  def create
    @delivery = Delivery_addresses.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to index
  end

  def index
    @delivery = Delivery_addresses.new
    @deliveries = current_customer.delivery_addresses.all
  end

  def edit
    @delivery = Delivery_addresses.find(params[:id])
  end

  def update
    @delivery = Delivery_addresses.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to deliveries_path(@delivery)
  end

  def destroy
    @delivery = Delivery_addresses.find(params[:id])
    @delivery.destroy
    redirect_to '/deliveries'
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :addressee)
  end

end
