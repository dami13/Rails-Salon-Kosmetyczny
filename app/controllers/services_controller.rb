class ServicesController < ApplicationController
  def index
    @services = Service.all
    render 'services/index', :layout => "application"
  end
end
