class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
      t.timestamp :deleted_at
    end
  end
end
