class CreateDiaryGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_goods do |t|
      t.references :diary, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamp :created_at, null: false
    end
    add_foreign_key :diary_goods, :diaries, column: :diary_id, on_delete: :cascade
    #add_index :diary_goods, [:diary_id, :user_id], unique: true
  end
end
