class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.string :yumyuck

      t.timestamps
    end
  end
end
