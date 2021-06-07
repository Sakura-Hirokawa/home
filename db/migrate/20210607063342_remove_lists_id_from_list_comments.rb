class RemoveListsIdFromListComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :list_comments, :lists_id, :integer
  end
end
