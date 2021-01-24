class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :num_of_members
      t.date :debut_date
      t.integer :group_type

      t.timestamps
    end
  end
end
