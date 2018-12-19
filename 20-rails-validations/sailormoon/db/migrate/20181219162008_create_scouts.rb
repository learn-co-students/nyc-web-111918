class CreateScouts < ActiveRecord::Migration[5.2]
  def change
    create_table :scouts do |t|
      t.string :planet
      t.string :hair_color
      t.boolean :pet
      t.integer :age

      t.timestamps
    end
  end
end
