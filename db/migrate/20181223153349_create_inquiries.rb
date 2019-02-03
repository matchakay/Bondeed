class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :user_id
      t.references :inquiry_category, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :is_check, null: false, default: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
      t.timestamp :deleted_at
    end
    add_foreign_key :inquiries, :users, column: :user_id, on_delete: :cascade
  end
end
