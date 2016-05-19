class ChangePostsGameToGameReference < ActiveRecord::Migration
  def change
    remove_column :posts, :game
    add_reference :posts, :game, index: true, foreign_key: true
  end
end
