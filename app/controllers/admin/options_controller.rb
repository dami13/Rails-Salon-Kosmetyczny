class Admin::OptionsController < ApplicationController
  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index
    render 'devise/registrations/edit'
  end
end
