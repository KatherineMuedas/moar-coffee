class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :drink_rating
      t.belongs_to :drink, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
