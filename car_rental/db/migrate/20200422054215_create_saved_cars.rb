class CreateSavedCars < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_cars do |t|
      t.belongs_to :user
      t.belongs_to :savedcar, class: 'Car'
      t.timestamps
    end
  end
end
