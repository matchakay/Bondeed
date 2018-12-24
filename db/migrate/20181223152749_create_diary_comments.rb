class CreateDiaryComments < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_comments do |t|
      t.references :diary, null: false
      t.references :user, null: false, foreign_key: true
      t.string :comment, null: false, limit: 100
      t.timestamp :created_at, null: false
      t.timestamp :deleted_at
    end
    add_foreign_key :diary_comments, :diaries, on_delete: :cascade
  end
end
