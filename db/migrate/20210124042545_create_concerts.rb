class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :concert_title
      t.integer :num_of_attendants
      t.date :concert_date

      t.timestamps
    end
  end
end
