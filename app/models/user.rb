class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :nullify

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :initialize_post_counter

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def initialize_post_counter
    self.postsCounter = 0
  end
end
