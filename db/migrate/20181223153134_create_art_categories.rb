class CreateArtCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :art_categories do |t|
      t.string :name, null: false, limit: 30
    end
  end
end
