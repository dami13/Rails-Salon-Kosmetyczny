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
    @employee = Employee.find(params[:id])
  end

  def show_remove
    @employee = Employee.find(params[:id])
  end

  def new
  end

  def remove
    @employee_service = EmployeeService.where("employee_id = ? AND service_id = ?", params[:employee_id], params[:service_id])
    @employee_service.delete_all(service_id: params[:service_id])

    redirect_to action: 'index'
  end

  def create
    @employee_service = EmployeeService.new
    @employee_service.employee_id = params[:employee_id]
    @employee_service.service_id = params[:service_id]
    if @employee_service.save
      redirect_to action: 'index'
    else
      redirect_to admin_employees_services_show_new_path(params[:employee_id])
    end
  end
end
