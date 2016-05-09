class Visit < ActiveRecord::Base

  belongs_to :client
  has_many :employees
  has_many :services

end
