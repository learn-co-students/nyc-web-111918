class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :hair_color
      t.string :blood_type

      t.timestamps
    end
  end
end
