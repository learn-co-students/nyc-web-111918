class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :model
      t.integer :wings

      t.timestamps
    end
  end
end
