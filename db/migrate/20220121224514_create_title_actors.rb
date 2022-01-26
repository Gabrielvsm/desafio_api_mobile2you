class CreateTitleActors < ActiveRecord::Migration[7.0]
  def change
    create_table :title_actors do |t|
      t.references :title, null: false, foreign_key: true
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
