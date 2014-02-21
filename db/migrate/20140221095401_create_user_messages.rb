class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :content
      t.integer :read_status

      t.timestamps
    end
  end
end
