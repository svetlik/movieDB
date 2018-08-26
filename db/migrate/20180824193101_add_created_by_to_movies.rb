class AddCreatedByToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :author, foreign_key: { to_table: :users }
  end
end
