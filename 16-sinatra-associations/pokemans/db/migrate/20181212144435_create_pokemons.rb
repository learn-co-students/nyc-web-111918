class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :nickname
      t.integer :health
      t.integer :trainer_id
    end
  end
end
