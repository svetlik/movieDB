class AddCategoryToMovie < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :category, foreign_key: true
  end
end
