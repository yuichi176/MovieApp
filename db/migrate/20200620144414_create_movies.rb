class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.integer :rating
      t.text :feelings

      t.timestamps
    end
  end
end
