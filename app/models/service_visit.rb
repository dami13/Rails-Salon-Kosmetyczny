class ServiceVisit < ActiveRecord::Base

  self.table_name = "services_visits"
  # belongs_to :employee_services
  belongs_to :visit
  belongs_to :employee
  belongs_to :service
  
  validates :client_opinion_comment, length: { maximum: 200 }
  
  validates :client_opinion_rating, numericality: true,
									length: { maximum: 1 }
									
  validates_inclusion_of :client_opinion_rating, in: 1..5
									
  # validates :client_opinion_added, presence: true

end
