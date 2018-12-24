class CreateHeirs < ActiveRecord::Migration[5.2]
  def change
    create_table :heirs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :art_category, null: false, foreign_key: true
      t.text :introduction
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
    end
  end
end
