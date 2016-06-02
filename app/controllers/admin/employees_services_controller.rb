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

  def show_new
  end

  def show_remove
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def remove
    @employee_service = EmployeeService.where("employee_id = ? AND service_id = ?", params[:employee_id], params[:service_id])
    @employee_service.delete_all(service_id: params[:service_id])

    redirect to 'index'
  end
  
  def create
  end
end
