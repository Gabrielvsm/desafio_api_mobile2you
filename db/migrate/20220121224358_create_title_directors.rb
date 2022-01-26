class CreateTitleDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :title_directors do |t|
      t.references :title, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
