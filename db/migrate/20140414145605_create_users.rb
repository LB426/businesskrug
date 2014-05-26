class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :group
      t.string :phone
      t.string :email
      t.string :locality
      t.string :password_open_text
      t.string :password_hash
      t.string :password_salt
      t.string :last_ip
      t.string :gender
      t.date   :birthday
      t.string :unique_id, :null => false
      t.timestamps
    end
  end
end
