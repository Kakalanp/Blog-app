class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :Title, presence: true, length: { maximum: 250 }
  validates :Text, presence: true
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  private

  def update_post_counter
    user.increment!(:postsCounter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
