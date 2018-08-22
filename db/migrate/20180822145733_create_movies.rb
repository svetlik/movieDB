class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :text
      t.float :rating
      t.integer :category

      t.timestamps
    end
  end
end
