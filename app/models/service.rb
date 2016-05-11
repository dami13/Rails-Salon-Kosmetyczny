class Service < ActiveRecord::Base

  has_many :employee_services
  has_many :employees, through :employee_services
  has_and_belongs_to_many :visits

end
