class AddContentToPinnedPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :pinned_posts, :content, :text
  end
end
