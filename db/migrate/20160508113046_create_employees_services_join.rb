class CreateEmployeesServicesJoin < ActiveRecord::Migration

  def up
    create_table :employees_services, id: false do |t|
      t.integer "employee_id"
      t.integer "service_id"
    end
    add_index :employees_services, [ "employee_id", "service_id"]
  end

  def down
    drop_table :employees_services
  end

end
