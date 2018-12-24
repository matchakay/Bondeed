class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user, null: false
      t.references :target_user, null: false
      t.boolean :is_scout, null: false
      t.boolean :is_ok
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
    end
    add_foreign_key :matches, :users, column: :user_id
    add_foreign_key :matches, :users, column: :target_user_id
  end
end
