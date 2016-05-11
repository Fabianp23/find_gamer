class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :gamertag
      t.string :game
      t.text :description
      t.string :language
      t.boolean :microphone

      t.timestamps null: false
    end
  end
end
