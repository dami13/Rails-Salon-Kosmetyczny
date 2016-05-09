class CreateClients < ActiveRecord::Migration

  def up
    create_table :clients do |t|
      # t.column "id" -> generowane automatycznie
      t.column "imie", :string, limit: 25
      t.column "nazwisko", :string, limit: 50
      t.column "email", :string, :default => "", :null => false
      t.column "adres", :string
      t.column "nr_telefonu", :integer
      t.column "password", :string, limit: 16, null: false

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end

end
