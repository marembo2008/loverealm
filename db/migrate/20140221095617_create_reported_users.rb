class CreateReportedUsers < ActiveRecord::Migration
  def change
    create_table :reported_users do |t|
      t.integer :reporter_id
      t.integer :reportee_id
      t.text :reason
      t.integer :content_id
      t.integer :content_type_id

      t.timestamps
    end
  end
end
