class ChangeCreditCardColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rented_cars, :credit_card_no, 0
  end
end
