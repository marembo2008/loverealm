class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.date :birthday
      t.string :password
      t.string :password_confirmation
      t.string :avatar
      t.bool :validated
      t.string :validation_code
      t.string, :emailsecret
      t.string :secretcode
      t.string :country

      t.timestamps
    end
  end
end
