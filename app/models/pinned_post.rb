class PinnedPost < ApplicationRecord
  belongs_to :user
  validates :content, length: {maximum: 200, minimum: 5}

  def author_avatar
    @post = PinnedPost.last
    @id = @post.user_id
    @author = User.find(@id)
    if @author.avatar.present?
      @author.avatar.url(:thumb)
    else
      'thumb/missing.jpg'
    end
  end

  def author
    @post = PinnedPost.last
    @id = @post.user_id
    @author = User.find(@id)
    [@author.first_name, @author.last_name].join(' ')
  end

  def active?
    time = Time.new
    now = time.localtime
    now - created_at < 86400
  end
end
