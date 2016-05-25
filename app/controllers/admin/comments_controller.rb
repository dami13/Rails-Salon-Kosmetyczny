class Admin::CommentsController < ApplicationController

  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def create
  end

  def edit
  end

  def index
    @visits = Visit.all
  end

  def new
  end

  def remove
  end

  def show
  end

  def update
  end
end
