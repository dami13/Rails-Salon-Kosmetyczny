class ReservationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render 'reservation/index', :layout => "application"
  end
  def create
    p = Reservation.new
    p.name = params[:name]
    p.email = params[:email]
    p.phone = params[:phone]
    p.date = params[:date]
    p.time = params[:time]
    p.save
    render 'reservation/reserved', :layout => "application"
  end
end
