class RemoveAddCinemaToMoviesFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :add_cinema_to_movies, :string
  end
end
