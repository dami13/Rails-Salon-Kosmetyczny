class EmployeeService < ActiveRecord::Base

  self.table_name = "employees_services"
  belongs_to :employee
  belongs_to :service
  belongs_to :service_visit

end
