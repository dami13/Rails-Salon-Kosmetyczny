class Employee < ActiveRecord::Base

  has_many :employee_services
  has_many :services, :through => :employee_services
  has_many :service_visits
  has_many :visits, :through => :service_visits

  # has_secure_password

  EMAIL_TEMPLATE = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
  # validates :email, :presence => true,
  #                  :length => { :maximum => 100 },
  #                  :format => EMAIL_TEMPLATE
  validates :desc, :length => { :maximum => 150 }
  validates :phone_number, :presence => true,
                    :length => { :maximum => 12 },
                    :numericality => true

end
