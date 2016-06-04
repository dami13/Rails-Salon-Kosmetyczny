class ServicesController < ApplicationController
  def index
    @services = Service.sorted
    render 'services/index', :layout => "application"
  end
end
