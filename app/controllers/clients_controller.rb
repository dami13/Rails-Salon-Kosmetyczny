class ClientsController < ApplicationController
 
 def index
    if !client_signed_in?
      redirect_to action: 'login'
    end
    render 'devise/registrations/edit'
  end

  def login
    if client_signed_in?
      render 'homepage/index'
     else
      render 'devise/sessions/new'
    end
  end

  def logout
  	destroy_client_session_path
  	render 'homepage/index'
  end

end
