class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.text :description
      t.belongs_to :shop, index: true

      t.timestamps
    end
  end
end
