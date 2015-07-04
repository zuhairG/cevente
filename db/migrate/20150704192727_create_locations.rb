class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :address1
      t.string :address2
      t.string :country
      t.string :city
      t.integer :zipcode
      t.string :state
      t.integer :phone_num

      t.timestamps null: false
    end
  end
end
