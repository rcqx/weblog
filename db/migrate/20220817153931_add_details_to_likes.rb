class AddDetailsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :authorId, :integer
    add_index :likes, :authorId
    add_column :likes, :postId, :integer
    add_index :likes, :postId
  end
end
