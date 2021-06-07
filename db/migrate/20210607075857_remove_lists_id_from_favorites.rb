class RemoveListsIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :lists_id, :integer
  end
end
