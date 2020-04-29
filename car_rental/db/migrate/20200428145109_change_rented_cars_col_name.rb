class ChangeRentedCarsColName < ActiveRecord::Migration[6.0]
  def change
    rename_column :rented_cars, :rentedcar_id, :car_id
  end
end
