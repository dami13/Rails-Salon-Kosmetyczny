class AddIdToEmployeesServices < ActiveRecord::Migration

  def up
    add_column :employees_services, :id, :primary_key
  end

  def down
    remove_column :employees_services, :id
  end

end
