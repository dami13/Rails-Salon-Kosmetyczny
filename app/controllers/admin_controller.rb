class AdminController < ApplicationController
  before_action :authenticate_employee!
  layout 'admin'

  def index
  end
end
