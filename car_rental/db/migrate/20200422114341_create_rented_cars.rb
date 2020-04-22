class CreateRentedCars < ActiveRecord::Migration[6.0]
  def change
    create_table :rented_cars do |t|
      t.belongs_to :user
      t.belongs_to :rentedcar, class: 'Car'
      t.bigint :credit_card_no, :null=>false
      t.integer :cvc, :null=>false
      t.date :credit_expired_date, :null=>false
      t.date :rent_from_date, :null=>false
      t.date :rent_to_date, :null=>false

      t.timestamps
    end
  end
end
