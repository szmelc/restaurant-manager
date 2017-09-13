class AddUserToPinnedPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :pinned_posts, :user, foreign_key: true
  end
end
