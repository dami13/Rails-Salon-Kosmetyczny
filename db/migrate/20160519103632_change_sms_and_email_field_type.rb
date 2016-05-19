class ChangeSmsAndEmailFieldType < ActiveRecord::Migration
  def self.up
    change_column :visits, :sms_time, :datetime
    change_column :visits, :email_time, :datetime
  end

  def self.down
    change_column :visits, :sms_time, :time
    change_column :visits, :email_time, :time
  end
end
