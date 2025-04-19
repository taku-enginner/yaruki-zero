class AddToneToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :tone, :integer
  end
end
