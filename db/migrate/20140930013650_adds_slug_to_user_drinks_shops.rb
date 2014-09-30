class AddsSlugToUserDrinksShops < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :drinks, :slug, :string
    add_column :shops, :slug, :string
  end
end
