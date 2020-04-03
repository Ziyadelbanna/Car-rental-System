class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name, :limit=>25, :null=>false, :unique=>true
      t.string :password, :limit=>25, :null=>false
      t.string :email, :limit=>50, :null=>false, :unique=>true
      t.string :name, :limit=>25, :null=>false
      t.string :address
      t.date :dob, :null=>false
      t.integer :age, :null=>false
      t.integer :points, :default=>0
      t.boolean :admin, :null=>false

      t.timestamps
    end
  end
end
