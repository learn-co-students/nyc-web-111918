class CreateUserBots < ActiveRecord::Migration[5.1]
  def change
    create_table :user_bots do |t|
      t.belongs_to :user
      t.belongs_to :bot

      t.timestamps
    end
  end
end
