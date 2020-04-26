class ChangeCvcColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rented_cars, :cvc, 0
  end
end
