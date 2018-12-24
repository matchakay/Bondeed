class CreateInquiryCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_categories do |t|
      t.string :name, null: false, limit: 20
    end
  end
end
