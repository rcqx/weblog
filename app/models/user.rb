class User < ApplicationRecord
  has_many :posts
  has_many :commments
  has_many :likes
  scope :posts, -> { joins(:posts).where(posts: { user_id: id }) }

  validates :name, presence: true, length: { in: 2..25 }
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end
end
