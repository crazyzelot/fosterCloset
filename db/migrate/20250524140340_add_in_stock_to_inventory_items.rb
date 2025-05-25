class AddInStockToInventoryItems < ActiveRecord::Migration[8.0]
  def change
    add_column :inventory_items, :in_stock, :integer
  end
end
