class CreateMotivations < ActiveRecord::Migration[7.2]
  def change
    create_table :motivations do |t|
      t.date :recorded_on
      t.integer :value

      t.timestamps
    end
  end
end
