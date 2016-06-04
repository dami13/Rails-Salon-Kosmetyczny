class Service < ActiveRecord::Base

  has_many :employee_services
  has_many :employees, :through => :employee_services
  has_many :service_visits
  has_many :visits, :through => :service_visits
  
  validates :name, presence: true,
				   length: { maximum: 25 }
  
  validates :description, presence: true,
						  length: { maximum: 2000 }
					
  validates :price, presence: true,
					length: { maximum: 3 },
					numericality: true
					
  validates :duration, presence: true,
					   length: { maximum: 3 },
					   numericality: true

  scope :sorted, lambda { order("services.name ASC") }
end
