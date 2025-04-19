class AddCommentToMotivations < ActiveRecord::Migration[7.2]
  def change
    add_column :motivations, :comment, :string
  end
end
