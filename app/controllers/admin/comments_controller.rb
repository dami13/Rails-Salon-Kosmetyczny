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
    @service_visit = ServiceVisit.find(params[:id])
  end

  def index
    if params[:c]

    else
      @c = ''
    end

    if params[:from]
      @from = params[:from]
    else
      @from = Date.today.at_beginning_of_month.strftime("%d.%m.%Y")
    end

    if params[:to]
      @to = params[:to]
    else
      @to = Date.today.at_beginning_of_month.next_month.strftime("%d.%m.%Y")
    end

    fromf = DateTime.parse(@from)
    tof = DateTime.parse(@to).end_of_day

    query = ServiceVisit.where(:client_opinion_added => fromf..tof).order(:client_opinion_added)

    if params[:e]
      @e = Employee.where(:first_name => :e)
    end

    @service_visit = query
  end

  def new
  end

  def remove
    @service_visit = ServiceVisit.find(params[:id])
    @service_visit.destroy

    redirect_to action: 'index'
  end

  def update
    @service_visit = ServiceVisit.find(params[:id])
    if @service_visit.update(params.require(:service_visit).permit(:client_opinion_comment, :status))
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end
end
