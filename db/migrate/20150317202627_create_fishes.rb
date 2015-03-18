class CreateFishes < ActiveRecord::Migration
  def change
    create_table :fishes do |t|
      t.string :species
      t.string :length
      t.integer :river_id
    end
  end
end
