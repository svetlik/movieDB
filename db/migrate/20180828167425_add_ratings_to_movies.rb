class AddRatingsToMovies < ActiveRecord::Migration[5.2]
  def up
    change_column :movies, :rating, :float, default: 0.0
  end

  def down
    change_column :movies, :rating, :integer, default: 0
  end
end
