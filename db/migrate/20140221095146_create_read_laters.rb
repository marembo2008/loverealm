class CreateReadLaters < ActiveRecord::Migration
  def change
    create_table :read_laters do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
