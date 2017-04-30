class CreateShoes < ActiveRecord::Migration[5.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.integer :size_class
      t.string :slug, unique: true

      t.timestamps
    end
  end
end
