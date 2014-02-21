class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :description
      t.integer :reply_to_id
      t.integer :artcile_id

      t.timestamps
    end
  end
end
