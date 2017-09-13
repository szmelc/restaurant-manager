class CreatePinnedPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :pinned_posts do |t|

      t.timestamps
    end
  end
end
