class Admin::VisitsController < ApplicationController

  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index

    @visits = Visit.all.order(:start_time)

  end

  def show
    @visit = Visit.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def remove
  end
end
