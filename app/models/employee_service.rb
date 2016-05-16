class EmployeeService < ActiveRecord::Base

  self.table_name = "employees_services"
  belongs_to :employee
  belongs_to :service
  # has_many :service_visits

end
