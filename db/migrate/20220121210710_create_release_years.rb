class CreateReleaseYears < ActiveRecord::Migration[7.0]
  def change
    create_table :release_years do |t|
      t.integer :year, null: false, unique: true

      t.timestamps
    end
  end
end
