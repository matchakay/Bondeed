class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :send_user_id, null: false
      t.string :receive_user_id, null: false
      t.text :content, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :messages, :users, column: :send_user_id, on_delete: :cascade
    add_foreign_key :messages, :users, column: :receive_user_id, on_delete: :cascade
  end
end
