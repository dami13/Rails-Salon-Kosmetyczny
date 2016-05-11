class Visit < ActiveRecord::Base

  belongs_to :client
  has_many :service_visits
  has_many :services, :through => :service_visits
  has_many :employees, :htrough => :service_visits

end
