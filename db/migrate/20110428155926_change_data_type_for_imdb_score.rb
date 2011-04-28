class ChangeDataTypeForImdbScore < ActiveRecord::Migration
  def self.up
    change_column :movies, :imdb_score, :decimal, :scale => 1
  end

  def self.down
    change_column :movies, :imdb_score, :float
  end
end

