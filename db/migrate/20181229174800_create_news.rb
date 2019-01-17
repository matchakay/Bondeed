class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :user_id, null: false
      t.text :content, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :news, :users, column: :user_id
  end
end
