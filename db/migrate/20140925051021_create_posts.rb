class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.boolean :starred

      t.timestamps
    end
  end
end
