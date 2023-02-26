class Public::DeliveryAddressesController < ApplicationController
  def create
    @delivery = DeliveryAddress.new(delivery_params)
    @delivery.customer_id = current_customer.id
    @delivery.save
    redirect_to delivery_addresses_path
  end

  def index
    @delivery = DeliveryAddress.new
    @deliveries = current_customer.delivery_addresses.all
  end

  def edit
    @delivery = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery = DeliveryAddress.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to  delivery_addresses_path
  end

  def destroy
    @delivery = DeliveryAddress.find(params[:id])
    @delivery.destroy
    redirect_to  delivery_addresses_path
  end

  private

  def delivery_params
    params.require(:delivery_address).permit(:postal_code, :address, :addressee)
  end

end
