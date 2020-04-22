class AddCardCvcToRentals < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :cardCVC, :integer
  end
end
