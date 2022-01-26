class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.string :rating_type, null: false, unique: true

      t.timestamps
    end
  end
end
