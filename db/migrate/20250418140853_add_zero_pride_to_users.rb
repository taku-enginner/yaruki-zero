class AddZeroPrideToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :zero_pride, :boolean
  end
end
