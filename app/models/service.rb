class Service < ActiveRecord::Base

  has_many :employee_services
  has_many :employees, :through => :employee_services
  has_many :service_visits
  has_many :visits, :through => :service_visits

end
