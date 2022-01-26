class RemoveTitlesConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :titles, :type_id, true
    change_column_null :titles, :country_id, true
    change_column_null :titles, :release_year_id, true
    change_column_null :titles, :rating_id, true
  end
end
