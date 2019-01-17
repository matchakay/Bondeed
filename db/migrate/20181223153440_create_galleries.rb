class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries, id: false do |t|
      t.string :id, primary_key: true
      t.string :user_id, null: false
      t.string :data, null: false, limit: 255
      t.string :comment, null: false, limit: 100
      t.timestamp :created_at, null: false
      t.timestamp :deleted_at
    end
    add_foreign_key :galleries, :users, column: :user_id
  end
end
