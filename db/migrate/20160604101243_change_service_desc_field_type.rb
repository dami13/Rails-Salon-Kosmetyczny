class ChangeServiceDescFieldType < ActiveRecord::Migration
  def change
    change_column :services, :description, :text, :limit => 2000
  end
end
