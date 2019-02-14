class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :user_id, null: false
      t.string :target_user_id, null: false
      t.boolean :is_scout, null: false
      t.boolean :is_ok
      t.boolean :is_add_list, null: false, default: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
    end
    add_foreign_key :matches, :users, column: :user_id, on_delete: :cascade
    add_foreign_key :matches, :users, column: :target_user_id, on_delete: :cascade
  end
end
