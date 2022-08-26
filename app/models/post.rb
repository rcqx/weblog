class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  scope :user, -> { joins(:users).where(user: { user_id: id }) }
  scope :comments, -> { joins(:comments).where(comments: { post_id: id }) }
  scope :likes, -> { joins(:likes).where(likes: { post_id: id }) }

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  after_create :update_post_counter

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:post_counter)
  end

end
