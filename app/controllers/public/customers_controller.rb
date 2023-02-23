class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration_path
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_customers_path
    else
      render :edit, notice: "変更に失敗しました"
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
