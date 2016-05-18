class AdminController < ApplicationController
  layout 'admin'

  def index
    if !employee_signed_in?
      redirect_to action: 'login'
    end
  end
  def login
    if employee_signed_in?
      redirect_to action: 'index'
    else
      render 'devise/sessions/new'
    end
  end
end
