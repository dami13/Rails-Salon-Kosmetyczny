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

  def cron

    visits = Visit.select('"visits".*,"clients"."email" as "mail","clients"."phone_number"').joins(:client).where('"visits"."sms" = "t" or "visits"."email" = "t"' ).where('"visits"."status" = "f"').all

    send_time = DateTime.now

    visits.each do |v|

      send_time = (v.start_time - 2.days).change(:hour => 10)

      if !v.sms_time? and send_time < DateTime.now

        v.update(:sms_time => send_time)

        Net::HTTP::post_form(URI.parse("http://api.smsapi.pl/sms.do"),{
            "username"=>"zgwyisco@eelmail.com",
            "password" => "c62d929e7b7e7b6165923a5dfc60cb56",
            "to"=>v.phone_number,
            "message"=>"Przypominamy o wizycie z dnia " +v.start_time.strftime("%d.%m.%Y")+" o godzinie "+v.start_time.strftime("%H:%M"),
            "from"=>"Eco"
        })

      end

      if !v.email_time and send_time < DateTime.now

        #v.update(:email_time => send_time)

        #todo dopisac funkcję wysylajaca maila z powiadomieniem

      end

    end

    render json: [send_time,visits]

  end
end
