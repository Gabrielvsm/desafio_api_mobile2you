class CreateTitleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :title_categories do |t|
      t.references :title, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
