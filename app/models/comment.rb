class Comment < ApplicationRecord
  belongs_to :post

  def author
    @id = user_id
    @user = User.find(@id)
    [@user.first_name, @user.last_name].join(' ')
  end

  def comment_author_id
    @id = user_id
    @user = User.find(@id)
    @user.id
  end

  def author_avatar
    @id = user_id
    @author = User.find(@id)
    if @author.avatar.present?
      @author.avatar.url(:thumb)
    else
      'thumb/missing.jpg'
    end
  end
end

