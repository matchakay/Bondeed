class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamp :created_at, null: false
    end
  end
end
