class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 50, null: false
      t.string :email, limit: 100, null: false
      t.string :password_digest, null: false
      t.string :admin, :boolean, default: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
