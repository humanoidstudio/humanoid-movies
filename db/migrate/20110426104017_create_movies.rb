class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name
      t.text :plot
      t.float :imdb_score
      t.integer :runtime

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
