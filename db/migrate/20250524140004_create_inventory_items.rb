class CreateInventoryItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_items, id: :uuid do |t|
      t.string :barcode
      t.string :category
      t.string :status

      t.timestamps
    end
    add_index :inventory_items, :barcode, unique: true
  end
end
