class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :user_id, null: false
      t.string :favorite_user_id, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :favorites, :users, column: :user_id
    add_foreign_key :favorites, :users, column: :favorite_user_id
  end
end
