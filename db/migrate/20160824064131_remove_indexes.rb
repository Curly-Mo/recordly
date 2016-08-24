class RemoveIndexes < ActiveRecord::Migration[5.0]
  def change
    remove_index :artists, :name
    remove_index :albums, :title
    remove_index :songs, :title
  end
end
