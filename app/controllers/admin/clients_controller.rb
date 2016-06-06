class Admin::ClientsController < ApplicationController
  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index
    @clients = Client.all
  end

  def new
    @clients = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def remove
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to action: 'index'
  end

  def show
    @client = Client.find(params[:id])

  end

  def update
    @client = Client.find(params[:id])
    if @client.update(params.require(:client).permit(:email, :first_name, :last_name, :phone_number, :address))
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def create
    @clients = Client.new(params.require(:client).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :address))
    if @clients.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end
end
