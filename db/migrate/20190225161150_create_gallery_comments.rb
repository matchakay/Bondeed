class CreateGalleryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_comments do |t|
      t.string :gallery_id, null: false
      t.string :user_id, null: false
      t.string :comment, null: false, limit: 100
      t.timestamp :created_at, null: false
      t.timestamp :deleted_at
    end
    add_foreign_key :gallery_comments, :galleries, column: :gallery_id, on_delete: :cascade
    add_foreign_key :gallery_comments, :users, column: :user_id, on_delete: :cascade
  end
end
