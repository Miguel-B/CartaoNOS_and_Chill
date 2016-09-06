class AddSessionsToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :sessions, :string
    add_column :movies, :add_cinema_to_movies, :string
    add_column :movies, :cinema, :string
  end
end
