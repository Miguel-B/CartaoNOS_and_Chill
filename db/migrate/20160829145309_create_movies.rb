class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :actors
      t.text :synopsis
      t.string :time
      t.string :poster

      t.timestamps
    end
  end
end
