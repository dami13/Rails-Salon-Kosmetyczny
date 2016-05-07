class CreateVisits < ActiveRecord::Migration

  def up
    create_table :visits do |t|
      t.integer "client_id"
      t.integer "cena", :integer
      t.integer "rabat", :integer
      t.string "uwagi", :string
      t.boolean "status", :boolean
      t.time "godzina_rozp"

      t.timestamps null: false
    end
    add_index("visits", "client_id")
  end

  def down
    remove_index("visits", "client_id")
    drop_table :visits
  end

end
