class Visit < ActiveRecord::Base

  belongs_to :client
  has_and_belongs_to_many :employees
  has_and_belongs_to_many :services

end
