class Post < ApplicationRecord
  belongs_to :user
  has_many :commments
  has_many :likes
  scope :user, -> { joins(:users).where(user: { user_id: id })}

  def update_counter
    user.update(post_counter: Post.where(user_id: user.id).count)    
  end
end