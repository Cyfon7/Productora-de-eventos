class AddStartEndColumnsToConcert < ActiveRecord::Migration[6.1]
  def change
    add_column :concerts, :concert_starts_at, :time
    add_column :concerts, :concert_ends_at, :time
  end
end
