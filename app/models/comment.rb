class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :post, -> { joins(:posts).where(post: { post_id: id }) }

  after_create :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
