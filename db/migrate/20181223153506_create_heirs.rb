class CreateHeirs < ActiveRecord::Migration[5.2]
  def change
    create_table :heirs do |t|
      t.string :user_id, null: false
      t.references :art_category, null: false, foreign_key: true
      t.text :introduction
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
    end
    add_foreign_key :heirs, :users, column: :user_id
  end
end
