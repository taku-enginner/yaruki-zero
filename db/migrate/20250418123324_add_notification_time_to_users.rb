class AddNotificationTimeToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :notification_time, :integer
  end
end
