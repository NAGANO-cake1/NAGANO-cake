class ApplicationController < ActionController::Base
    before_action :authenticate_admin!, if: :admin_url
    before_action :authenticate_customer!, if: :customer_url

  def admin_url
     request.fullpath.include?("/admin")
  end
  
  def customer_url
     request.fullpath.include?("/customer")
  end

end
