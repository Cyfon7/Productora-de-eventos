class RemoveGroupRefToConcert < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :concerts, :Groups
  end
end
