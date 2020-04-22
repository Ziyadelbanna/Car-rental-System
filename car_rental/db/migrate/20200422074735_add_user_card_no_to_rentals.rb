class AddUserCardNoToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :userCardNo, :bigint
  end
end
