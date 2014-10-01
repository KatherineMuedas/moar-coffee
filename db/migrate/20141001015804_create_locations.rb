class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :lat
      t.float :long
      t.belongs_to :shop, index: true

      t.timestamps
    end
  end
end
