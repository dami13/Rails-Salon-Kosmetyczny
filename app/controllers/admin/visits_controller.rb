class Admin::VisitsController < ApplicationController

  before_action :require_admin_login

  layout 'admin'

  def require_admin_login
    if !employee_signed_in?
      redirect_to admin_login_url
    end
  end

  def index

    allvisits = Visit.all

    @events = Array.new

    allvisits.each do | v |

      duration = 0

      v.service_visits.each do | s |
        duration += s.service.duration
      end

      c = ''
      if v.status?
        c = ', backgroundColor: "green"'
      end

      @events.push('{
        title: "' + v.client.first_name + ' ' + v.client.last_name + '",
        start: "' + v.start_time.to_time.iso8601 + '",
        end: "' + (v.start_time + duration.minutes).to_time.iso8601 + '"' + c + '
      }')

    end

    @events = @events.join(',')

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

    @select =  'all'
    if params[:status]
      @select =  params[:status]
    end

    fromf = DateTime.parse(@from)
    tof = DateTime.parse(@to).end_of_day

    query = Visit.where(:start_time => fromf..tof).order(:start_time)
    if params[:status] and (params[:status] == 't' or params[:status] == 'f')
      query = query.where(:status => params[:status])
    end

    @select =  params[:status]

    @visits = query
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def edit
  end

  def update
  end

  def new

    @visit = Visit.new

    @se = Service.all.collect{|s| {:id => s.id, :name => s.name, :price => s.price, :duration => s.duration, :employees => s.employees.all.collect{|x| {:id => x.id, :name => x.last_name+' '+x.first_name} }}}
    @sejson = @se.to_json

  end

  def create
  end

  def remove
  end
end
