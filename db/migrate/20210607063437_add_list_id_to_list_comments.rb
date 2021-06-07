class AddListIdToListComments < ActiveRecord::Migration[5.2]
  def change
    add_column :list_comments, :list_id, :integer
  end
end
