class CreateReadArticles < ActiveRecord::Migration
  def change
    create_table :read_articles do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
