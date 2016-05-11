class Client < ActiveRecord::Base

  has_many :visits

  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
  validates :address, presence: true,
                      :length => { :maximum => 100 }
  validates :phone_number, :presence => true,
                            :length => { :maximum => 12 },
                            :numericality => true

end
