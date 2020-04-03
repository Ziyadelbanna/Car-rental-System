class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.date :start_date, :null=>false
      t.date :end_date, :null=>false
      t.float :cost, :null=>false

      t.timestamps
    end
  end
end
