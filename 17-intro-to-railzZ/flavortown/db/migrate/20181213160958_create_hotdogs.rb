class CreateHotdogs < ActiveRecord::Migration[5.2]
  def change
    create_table :hotdogs do |t|
      t.integer :size
      t.boolean :beef
      t.boolean :kosher
      t.string :name

      t.timestamps
    end
  end
end
