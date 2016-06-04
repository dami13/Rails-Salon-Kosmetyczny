class Visit < ActiveRecord::Base

  belongs_to :client
  has_many :service_visits
  has_many :services, :through => :service_visits
  has_many :employees, :through => :service_visits
  
  validates :client_id, presence: true
  
  validates :price, presence: true,
					numericality: true
					
  # validates :discount
  
  validates :comments, length: { maximum: 200 }
  
  validates :start_time, presence: true
  
  # validates :sms_time
  
  # validates :email_time
  
end
