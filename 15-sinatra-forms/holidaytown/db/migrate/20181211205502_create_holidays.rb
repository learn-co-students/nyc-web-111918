class CreateHolidays < ActiveRecord::Migration
  def change
      create_table :holidays do |t|
        t.string :name
        t.integer :days
        t.boolean :hero
      end
  end
end
