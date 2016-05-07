class CreateServices < ActiveRecord::Migration

  def up
    create_table :services do |t|
      # pamietac, ze id to oczywiscie model_id -> :service_id
      t.column "nazwa", :string, limit: 15
      t.column "opis", :string, limit: 150
      t.column "cena", :integer, limit: 3
      t.column "czas_trwania", :integer, limit: 3 # podany w minutach

      t.timestamps null: false
    end
  end

  def down
    drop_table :services
  end

end
