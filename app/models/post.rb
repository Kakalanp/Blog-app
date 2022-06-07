class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_post_counter
    user.increment!(:PostsCounter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
