class AddTonePreferenceToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :tone_preference, :integer, default: 0
  end
end
