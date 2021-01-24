class AddGroupRefToConcert < ActiveRecord::Migration[6.1]
  def change
    add_reference :concerts, :group, null: false, foreign_key: true
  end
end
