class AddsShopidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :shop_id, :integer
  end
end
