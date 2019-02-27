class CreateGalleryGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_goods do |t|
      t.string :gallery_id, null: false
      t.string :user_id, null: false
      t.timestamp :created_at, null: false
    end
    add_foreign_key :gallery_goods, :galleries, column: :gallery_id, on_delete: :cascade
    add_foreign_key :gallery_goods, :users, column: :user_id, on_delete: :cascade
  end
end
