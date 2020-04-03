class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :model, :limit=>25, :null=>false
      t.float :rank, :default=>0
      t.float :rent, :null=>false
      t.boolean :automatic, :null=>false
      t.boolean :airconditioned, :null=>false
      t.integer :productionYear, :null=>false
      t.integer :seats, :null=>false
      t.text :discription, :limit=>1000

      t.timestamps
    end
  end
end
