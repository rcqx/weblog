class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  after_create :update_post_counter
  after_destroy :decrement_post_counter

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:post_counter)
  end

  def decrement_post_counter
    user.decrement!(:post_counter)
  end
end
