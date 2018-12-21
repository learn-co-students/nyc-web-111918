class CreateNachos < ActiveRecord::Migration[5.2]
  def change
    create_table :nachos do |t|
      t.string :name
      t.integer :price, default: 15
      t.string :description

      t.timestamps
    end
  end
end
