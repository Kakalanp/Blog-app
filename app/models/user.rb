class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :nullify

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
