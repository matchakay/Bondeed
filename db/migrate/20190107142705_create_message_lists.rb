class CreateMessageLists < ActiveRecord::Migration[5.2]
  def change
    create_table :message_lists do |t|
      t.references :creator_user, null: false
      t.references :heir_user, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
    end
    add_foreign_key :message_lists, :users, column: :creator_user_id
    add_foreign_key :message_lists, :users, column: :heir_user_id
  end
end
