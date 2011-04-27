class AddPublishedNameToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :published_name, :string
  end

  def self.down
    remove_column :movies, :published_name
  end
end
