class UpdateTotalRentalsCarColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :total_rentals, :car_id_id, :car_id
  end
end
