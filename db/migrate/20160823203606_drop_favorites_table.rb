class DropFavoritesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :favorites
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end