class Admin::ServiceController < ApplicationController

  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index
    @services = Service.all
  end

  def new
    @services = Service.new
  end

  def edit
    @services = Service.find(params[:id])
  end

  def remove
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to action: 'index'
  end

  def show
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(params.require(:service).permit(:name, :description, :price, :duration))
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def create
    @service = Service.new(params.require(:service).permit(:name, :description, :price, :duration))
    if @service.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

end
