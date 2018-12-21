class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :avatar, default: 'https://media.gq.com/photos/59dfc6d9d61cb80476584e18/3:2/w_800/guy-fieiri-flame.jpg'

      t.timestamps
    end
  end
end
