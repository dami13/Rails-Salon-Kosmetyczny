class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  module ContentHelper
    def resource_name
      :employee
    end

    def resource
      @resource ||= Employee.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:employee]
    end
  end
  helper_method :resource, :resource_name, :devise_mapping
end
