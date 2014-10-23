class AddShopIdToAcivities < ActiveRecord::Migration
  def change
    add_column :activities, :shop_id, :integer
  end
end