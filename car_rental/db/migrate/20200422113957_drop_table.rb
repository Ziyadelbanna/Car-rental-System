class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :rented_cars
  end
end
