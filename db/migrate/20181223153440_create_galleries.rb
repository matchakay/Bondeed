class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :data, null: false, limit: 255
      t.string :comment, null: false, limit: 100
      t.timestamp :created_at, null: false
      t.timestamp :deleted_at
    end
  end
end
