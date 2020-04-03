class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites, primary_key: [:user_id, :car_id] do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
