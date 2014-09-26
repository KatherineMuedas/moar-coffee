class AddsNameZipcodeAndGenderToDevise < ActiveRecord::Migration
  def change
    add_column :users, :zipcode, :string
    add_column :users, :gender, :boolean
  end
end
