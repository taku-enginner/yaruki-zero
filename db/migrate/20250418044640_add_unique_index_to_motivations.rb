class AddUniqueIndexToMotivations < ActiveRecord::Migration[7.2]
  def change
    add_index :motivations, :recorded_on, unique: true
  end
end
