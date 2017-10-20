class RemoveBelongsToFromPinnedPosts < ActiveRecord::Migration[5.1]
  def change
  	if column_exists? :pinned_posts, :belongs_to
	    remove_column :pinned_posts, :belongs_to, :user
	  end
  end
end
