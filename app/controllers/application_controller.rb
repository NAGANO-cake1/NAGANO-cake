class ApplicationController < ActionController::Base
    before_action :authenticate_admin!, if: -> { request.path =~ /^\/admin/ }
    before_action :authenticate_customer!, if: -> { request.path =~ /^\/customer/ }

  private

  def admin_url
     request.fullpath.include?("/admin")
  end

  def customer_url
     request.fullpath.include?("/customer")
  end
end
