class ServiceVisit < ActiveRecord::Base

  self.table_name = "services_visits"
  # belongs_to :employee_services
  belongs_to :visit
  belongs_to :employee
  belongs_to :service

end
