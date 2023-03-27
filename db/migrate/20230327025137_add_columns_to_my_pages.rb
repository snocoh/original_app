class AddColumnsToMyPages < ActiveRecord::Migration[6.0]
  def change
    add_column :my_pages, :latitude, :float
    add_column :my_pages, :longitude, :float
  end
end
