class CreateUsers < ActiveRecord::Migration[5.2]
  def change # what it's called now
    create_table :users do |t| # t stands for table
      # add a bunch of columns to it
      t.text :name
      # id # I'm nice, id
      t.text :email
      t.integer :age
      # add_column()
    end
  end
end
