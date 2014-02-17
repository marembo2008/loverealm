class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.integer :uid
      t.string :description

      t.timestamps
    end
  end
end
