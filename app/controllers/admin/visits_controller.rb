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

    allvisits.each do |v|

      duration = 0

      v.service_visits.each do |s|
        duration += s.service.duration
      end

      @events.push(:title => v.client.first_name + ' ' + v.client.last_name, :start => v.start_time, :end => (v.start_time + duration.minutes), :backgroundColor => ((v.status) ? 'green' : '' ) )
    end

    @events = @events.to_json

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

    @select = 'all'
    if params[:status]
      @select = params[:status]
    end

    fromf = DateTime.parse(@from)
    tof = DateTime.parse(@to).end_of_day

    query = Visit.where(:start_time => fromf..tof).order(:start_time)
    if params[:status] and (params[:status] == 't' or params[:status] == 'f')
      query = query.where(:status => params[:status])
    end

    @select = params[:status]

    @visits = query
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def edit
    @visit = Visit.find(params[:id])

    @se = Service.all.collect { |s| {:id => s.id, :name => s.name, :price => s.price, :duration => s.duration, :employees => s.employees.all.collect { |x| {:id => x.id, :name => x.last_name+' '+x.first_name} }} }
    @sejson = @se.to_json

    @services = ServiceVisit.select('*').joins(:service, :employee).where(:visit_id => params[:id]).all.collect { |s| {:employee => s.employee_id, :service => s.service_id, :name => s.name, :duration => s.duration, :price => s.price, :employee_name => s.last_name+' '+s.first_name} }
    @services = @services.to_json

    render 'new'
  end

  def update

    @visit = Visit.find(params[:id])

    @se = Service.all.collect { |s| {:id => s.id, :name => s.name, :price => s.price, :duration => s.duration, :employees => s.employees.all.collect { |x| {:id => x.id, :name => x.last_name+' '+x.first_name} }} }
    @sejson = @se.to_json

    @services = ServiceVisit.select('*').joins(:service, :employee).where(:visit_id => params[:id]).all.collect { |s| {:employee => s.employee_id, :service => s.service_id, :name => s.name, :duration => s.duration, :price => s.price, :employee_name => s.last_name+' '+s.first_name} }
    @services = @services.to_json

    p = params.require(:visit)

    if p[:services]
      price = Service.where(:id => p[:services].collect { |s| s.split(',')[0] }).sum(:price)
      price = (price - (price * (p[:discount].to_i / 100.0))).to_i
    else
      price = 0
    end

    if @visit.update(
        :client_id => p[:client_id],
        :price => price,
        :discount => p[:discount],
        :comments => p[:comments],
        :status => p[:status],
        :start_time => p[:start_time],
        :sms => p[:sms],
        :email => p[:email]
    )

      if p[:services]

        ServiceVisit.where(:visit_id => @visit.id).delete_all

        p[:services].each do |se|

          s = se.split(',')[0]
          e = se.split(',')[1]
          @sv = ServiceVisit.new(:client_id => p[:client_id], :employee_id => e, :service_id => s, :visit_id => @visit.id, :client_opinion_rating => 1)
          @sv.save

        end
      end



      redirect_to action: 'edit'
      #render json: @visit

    else
      render 'new'
    end


  end

  def new

    @visit = Visit.new

    @se = Service.all.collect { |s| {:id => s.id, :name => s.name, :price => s.price, :duration => s.duration, :employees => s.employees.all.collect { |x| {:id => x.id, :name => x.last_name+' '+x.first_name} }} }
    @sejson = @se.to_json

  end

  def create

    @se = Service.all.collect { |s| {:id => s.id, :name => s.name, :price => s.price, :duration => s.duration, :employees => s.employees.all.collect { |x| {:id => x.id, :name => x.last_name+' '+x.first_name} }} }
    @sejson = @se.to_json

    p = params.require(:visit)

    if p[:services]
      price = Service.where(:id => p[:services].collect { |s| s.split(',')[0] }).sum(:price)
      price = (price - (price * (p[:discount].to_i / 100.0))).to_i
    else
      price = 0
    end


    @visit = Visit.new(
        :client_id => p[:client_id],
        :price => price,
        :discount => p[:discount],
        :comments => p[:comments],
        :status => p[:status],
        :start_time => p[:start_time],
        :sms => p[:sms],
        :email => p[:email]
    )

    if @visit.save

      if p[:services]
        p[:services].each do |se|

          s = se.split(',')[0]
          e = se.split(',')[1]

          @sv = ServiceVisit.new(:client_id => p[:client_id], :employee_id => e, :service_id => s, :visit_id => @visit.id, :client_opinion_rating => 1)
          @sv.save


        end
      end

      redirect_to action: 'index'

    else
      render 'new'

    end

  end

  def remove
  end

  def scheduler

    ids = params[:id].split(',').uniq

    @visits = Visit.select('"visits"."id", "visits"."start_time", SUM("duration") as duration').joins('LEFT JOIN "services_visits" ON "visits"."id"="services_visits"."visit_id"', 'LEFT JOIN "services" ON "services"."id"="services_visits"."service_id"', 'LEFT JOIN "employees" ON "employees"."id"="services_visits"."employee_id"').where('services_visits.employee_id' => ids).group('"visits"."id"')
    @visits = @visits.collect { |v| {:id => v.id, :start => v.start_time, :end => (v.start_time+ v.duration.minutes)} }

    render json: @visits
  end
end
