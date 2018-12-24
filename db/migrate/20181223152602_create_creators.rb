class CreateCreators < ActiveRecord::Migration[5.2]
  def change
    create_table :creators do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, limit: 30
      t.references :category, null: false
      t.integer :establishment, null: false
      t.integer :employee, null: false
      t.string :postal_code, null: false, limit: 7
      t.string :address_1, null: false, limit: 50
      t.string :address_2, null: false, limit: 50
      t.text :introduction
      t.boolean :is_recruitment, null: false
      t.timestamp :created_at, null: false
      t.timestamp :updated_at
      t.timestamp :deleted_at
    end
  end
end
