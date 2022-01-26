class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.string :show_id, null: false, unique: true
      t.string :title, null: false
      t.date :date_added
      t.string :duration
      t.text :description
      t.references :type, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :release_year, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
