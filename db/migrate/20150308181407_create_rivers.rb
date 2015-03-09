class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :city
      t.string :state
    end
  end
end
