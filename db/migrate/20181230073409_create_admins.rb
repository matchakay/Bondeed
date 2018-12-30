class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false, limit: 50
      t.string :login_id, null: false
      t.string :password_digest, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
      t.timestamp :deleted_at
    end
  end
end
