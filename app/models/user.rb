class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  scope :posts, -> { joins(:posts).where(posts: { user_id: id }) }
  scope :comments, -> { joins(:comments).where(comments: { user_id: id }) }


  validates :name, presence: true, length: { in: 2..25 }
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_post_counter
    User.find_by_id(id).update(post_counter: likes.where(post_id: id).count)
  end
end
