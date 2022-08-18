class Post < ApplicationRecord
  belongs_to :user
  has_many :commments
  has_many :likes
end