class CreateLikestatuses < ActiveRecord::Migration
  def change
    create_table :likestatuses do |t|
      t.integer :status_id
      t.integer :user_id

      t.timestamps
    end
  end
end
