class ChangeClientOpinionAddedColumnTypeToDatetime < ActiveRecord::Migration

  def self.up
    change_column :services_visits, :client_opinion_added, :datetime
  end
  
  def self.down
    change_column :services_visits, :client_opinion_added, :boolean
  end
 
end
