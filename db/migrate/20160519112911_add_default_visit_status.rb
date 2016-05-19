class AddDefaultVisitStatus < ActiveRecord::Migration
  def change
    change_column :visits, :status, :boolean, default: false
  end
end
