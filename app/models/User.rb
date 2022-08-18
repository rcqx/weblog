class User < ApplicationRecord
  has_many :posts
  has_many :commments
  has_many :likes
  scope :posts, -> { joins(:posts).where(posts: { user_id: id }) }
  
  def last_posts
    posts.limit(3)
  end
end