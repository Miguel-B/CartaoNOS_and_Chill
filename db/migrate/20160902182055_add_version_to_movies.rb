class AddVersionToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :version, :string
  end
end
