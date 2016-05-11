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
    employees = Employee.new(params[:client])
    employees.created_at = Time.now
    employees.updated_at = Time.now
    @employees = employees
    if @employees.save
      redirect_to @employees
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end
end
