class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true, length: { in: 2..25 }
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  ROLES = %i[user admin].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def admin?
    is?('admin')
  end

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_post_counter
    User.find_by_id(id).update(post_counter: likes.where(post_id: id).count)
  end
end
