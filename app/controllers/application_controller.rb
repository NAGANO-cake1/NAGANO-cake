class ApplicationController < ActionController::Base
    before_action :authenticate_admin!, if: -> { request.path =~ /^\/admin/ }
    before_action :authenticate_customer!, if: -> { request.path =~ /^\/customer/ }

#   private

#   def authenticate_admin!
#     #  request.fullpath.include?("/admin")
#   end

#   def authenticate_customer!
#     #  request.fullpath.include?("/customer")
#   end
end
