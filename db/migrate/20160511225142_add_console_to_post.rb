class AddConsoleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :console, :string
  end
end
