class CreateBasicCredentials < ActiveRecord::Migration
  def change
    create_table :basic_credentials do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
