class Admin::EmployeesController < ApplicationController

  layout 'admin'

  def index

    @employees = Employee.all

  end

  def new
    @employees = Employee.new
  end

  def edit
    @employee = Employee.find_by(params[:id])
  end

  def remove
    @employee = Employee.find_by(params[:id])
    @employee.destroy

    redirect_to action: 'index'
  end

  def show
  end

  def update
    @employee = Employee.find_by(params[:id])
    if @employee.update(params.require(:employee).permit(:first_name, :last_name, :phone_number, :desc))
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end

  def create
    @employees = Employee.new(params.require(:employee).permit(:email, :password,:password_confirmation, :first_name, :last_name, :phone_number, :desc))
    if @employees.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end
end
