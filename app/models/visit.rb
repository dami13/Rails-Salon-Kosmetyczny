class Visit < ActiveRecord::Base

  belongs_to :client
  has_many :service_visits
  has_many :services, :through => :service_visits
  has_many :employees, :through => :service_visits

end
