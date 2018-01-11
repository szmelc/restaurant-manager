class Post < ApplicationRecord
  validates :content, length: {minimum: 5}
  belongs_to :user
  has_many :comments

  def author_avatar
    @id = user_id
    @author = User.find(@id)
    if @author.avatar.present?
      @author.avatar.url(:thumb)
    else
      'thumb/missing.jpg'
    end
  end

  def author
    @id = user_id
    @author = User.find(@id)
    [@author.first_name, @author.last_name].join(' ')
  end

  def date
    @date = created_at.strftime('%Y.%m.%d %k:%M')
  end
end
