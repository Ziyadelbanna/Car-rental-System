class CreateTotalRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :total_rentals do |t|
      t.belongs_to :user
      t.belongs_to :car_id, class: 'Car'
      t.bigint :credit_card_no, :null=>false, :default=> 0
      t.integer :cvc, :null=>false, :default=> 0
      t.date :credit_expired_date, :null=>false, :default=>'2020-04-09'
      t.date :rent_from_date, :null=>false, :default=>'2020-04-09'
      t.date :rent_to_date, :null=>false, :default=>'2020-04-09'
      t.timestamps
    end
  end
end
