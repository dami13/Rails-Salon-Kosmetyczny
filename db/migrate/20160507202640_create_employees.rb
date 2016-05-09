class CreateEmployees < ActiveRecord::Migration

  def up
    create_table :employees do |t|
      # t.column "employee_id"
      t.column "imie", :string, limit: 20, null: false
      t.column "nazwisko", :string, limit: 50, null: false
      t.column "email", :string, null: false
      t.column "telefon", :integer
      t.column "opis", :string, limit: 250
      t.column "password", :string
      t.column "czy_admin", :boolean

      t.timestamps null: false
    end
  end

  def down
    drop_table :employees
  end

end
