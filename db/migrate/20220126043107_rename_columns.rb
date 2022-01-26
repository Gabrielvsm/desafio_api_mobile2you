class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :release_years, :year, :release_year
    rename_column :categories, :category_name, :category
    rename_column :countries, :name, :country
  end
end
