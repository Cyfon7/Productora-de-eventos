class RemoveColumnFromConcerts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concerts, :Group_id
  end
end
