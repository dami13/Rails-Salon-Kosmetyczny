class Admin::EmployeesController < ApplicationController

  layout 'admin'

  def index

    @employees = Employee.all

  end

  def new
    @employees = Employee.new
  end

  def edit
  end

  def show
  end

  def create
    @employees = Employee.new(params.require(:employee).permit(:first_name, :last_name, :phone_number, :desc))
    if @employees.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end
end
