class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :send_user, null: false
      t.references :receive_user, null: false
      t.text :content, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :messages, :users, column: :send_user_id
    add_foreign_key :messages, :users, column: :receive_user_id
  end
end
