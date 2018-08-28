class ImproveMovies < ActiveRecord::Migration[5.2]
  def up
    change_column :movies, :rating, :float, default: 0.0
    add_reference :movies, :ratings, default: []
  end

  def down
    change_column :movies, :rating, :integer, default: 0
    remove_reference :movies, :ratings, default: []
  end
end
