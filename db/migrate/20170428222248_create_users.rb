class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :shoe_size
      t.integer :status

      t.timestamps
    end
  end
end
