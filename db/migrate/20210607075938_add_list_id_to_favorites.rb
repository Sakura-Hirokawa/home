class AddListIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :list_id, :integer
  end
end
