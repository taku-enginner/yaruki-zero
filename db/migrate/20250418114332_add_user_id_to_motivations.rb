class AddUserIdToMotivations < ActiveRecord::Migration[7.2]
  def change
    add_reference :motivations, :user, foreign_key: true, null: false
  end
end
