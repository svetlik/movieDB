class ImproveMovies < ActiveRecord::Migration[5.2]
  def up
    add_reference :movies, :ratings, default: []
  end

  def down
    remove_reference :movies, :ratings, default: []
  end
end
