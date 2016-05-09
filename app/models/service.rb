class Service < ActiveRecord::Base

  has_and_belongs_to_many :employees
  has_and_belongs_to_many :visits

end
