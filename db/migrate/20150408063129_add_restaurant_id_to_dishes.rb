class AddRestaurantIdToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :restaurant_id, :integer
    add_index :dishes, :restaurant_id
  end
end
