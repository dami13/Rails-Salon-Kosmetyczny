class Admin::EmployeesController < ApplicationController

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

  def new
    @employees = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def remove
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to action: 'index'
  end

  def show
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(params.require(:employee).permit(:email, :first_name, :last_name, :phone_number, :desc, :is_admin))
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end

  def create
    @employees = Employee.new(params.require(:employee).permit(:email, :password,:password_confirmation, :first_name, :last_name, :phone_number, :desc, :is_admin))
    if @employees.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end
end
