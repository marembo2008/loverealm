class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :image
      t.integer :user_id
      t.string :title
      t.text :subtitle
      t.text :content
      t.integer :is_draft

      t.timestamps
    end
  end
end
