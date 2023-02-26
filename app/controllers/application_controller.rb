class ApplicationController < ActionController::Base
    before_action :authenticate_admin!, if: -> { request.path =~ /^\/admin/ }
    before_action :authenticate_customer!, if: -> { request.path =~ /^\/customer/ || request.path =~ /^\/cart_items/ || request.path =~ /^\/orders/ || request.path =~ /^\/delivery_addresses/ }

  private
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end
end
