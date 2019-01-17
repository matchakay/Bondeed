class CreateDiaryGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_goods do |t|
      t.string :diary_id, null: false
      t.string :user_id, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :diary_goods, :diaries, column: :diary_id, on_delete: :cascade
    add_foreign_key :diary_goods, :users, column: :user_id, on_delete: :cascade
  end
end
