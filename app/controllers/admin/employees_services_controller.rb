class Admin::EmployeesServicesController < ApplicationController
  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
  end

  def remove
  end

  def create
  end
end
