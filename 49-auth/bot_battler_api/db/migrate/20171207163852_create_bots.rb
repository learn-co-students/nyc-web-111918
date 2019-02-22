class CreateBots < ActiveRecord::Migration[5.1]
  def change
    create_table :bots do |t|
      t.string :name
      t.integer :health
      t.integer :damage
      t.integer :armor
      t.string :bot_class
      t.string :catchphrase
      t.string :avatar_url

      t.timestamps
    end
  end
end
