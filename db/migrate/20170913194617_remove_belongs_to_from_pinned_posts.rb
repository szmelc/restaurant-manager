class RemoveBelongsToFromPinnedPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :pinned_posts, :belongs_to, :user
  end
end
