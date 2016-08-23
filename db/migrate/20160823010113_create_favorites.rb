class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true
      t.references :album, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
