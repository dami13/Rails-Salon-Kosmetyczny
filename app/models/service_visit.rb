class ServiceVisit < ActiveRecord::Base

  self.table_name = "services_visits"
  has_many :employee_services
  has_many :visits

end
