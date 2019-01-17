class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :name, null: false, limit: 20
      t.string :email, null: false, unique: true, limit: 256
      t.string :avatar_path, limit: 255
      t.boolean :is_creator, null: false, default: false
      t.date :birthday, null: false
      t.boolean :is_man, null: false
      t.string :password_digest, null: false
      t.text :profile
      t.boolean :is_certified, null: false, default: false
      t.timestamp :created_at, null: false
      t.timestamp :login_time
      t.timestamp :deleted_at
    end
  end
end
