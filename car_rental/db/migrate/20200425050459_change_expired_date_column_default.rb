class ChangeExpiredDateColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rented_cars, :credit_expired_date, '2020-04-09'

  end
end
