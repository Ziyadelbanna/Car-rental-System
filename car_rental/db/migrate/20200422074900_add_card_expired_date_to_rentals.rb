class AddCardExpiredDateToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :cardExpiredDate, :date
  end
end
