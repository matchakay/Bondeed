class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries, id: false do |t|
      t.string :id, primary_key: true
      t.string :user_id, null: false
      t.text :content, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
      t.timestamp :deleted_at
    end
    add_foreign_key :diaries, :users, column: :user_id, on_delete: :cascade
  end
end
