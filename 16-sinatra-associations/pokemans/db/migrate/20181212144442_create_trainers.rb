class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :t_name
      t.integer :badges
    end
  end
end
