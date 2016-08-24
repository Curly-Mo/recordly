class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    enable_extension :citext
    change_column :artists, :name, :citext
    add_index :artists, :name, unique: true

    change_column :albums, :title, :citext
    add_index :albums, :title, unique: true

    change_column :songs, :title, :citext
    add_index :songs, :title, unique: true
  end
end
