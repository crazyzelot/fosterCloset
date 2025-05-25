class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.order(:category)
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    if @inventory_item.save
      redirect_to inventory_items_path, notice: 'Inventory item was successfully created.'
    else
      render :new
    end
  end

  def remove
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.update(status: InventoryItem::STATUS_REMOVED)
    redirect_to inventory_items_path, notice: 'Item has been removed from inventory.'
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:category, :barcode, :status, :in_stock)
  end
end 