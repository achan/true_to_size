class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.integer :type

      t.timestamps
    end
  end
end
