class InventoryManagementController < ApplicationController
  def index
  end

  def update_stock
    barcodes = params[:barcode].split(',').map(&:strip)
    quantity = params[:quantity].to_i
    is_removal = params[:is_removal] == 'true'

    results = []
    errors = []

    barcodes.each do |barcode|
      @inventory_item = InventoryItem.find_by(barcode: barcode)
      
      if @inventory_item
        if is_removal
          if @inventory_item.in_stock < quantity
            errors << "Cannot remove #{quantity} items from #{barcode}. Only #{@inventory_item.in_stock} items in stock."
            next
          end
          new_stock = @inventory_item.in_stock - quantity
          @inventory_item.update(in_stock: new_stock)
          results << "Removed #{quantity} items from #{barcode}. New stock: #{new_stock}"
        else
          new_stock = @inventory_item.in_stock + quantity
          @inventory_item.update(in_stock: new_stock)
          results << "Added #{quantity} items to #{barcode}. New stock: #{new_stock}"
        end
      else
        errors << "Barcode '#{barcode}' not found in the system."
      end
    end

    if errors.any?
      render json: { 
        success: false, 
        message: errors.join("\n"),
        results: results
      }, status: :unprocessable_entity
    else
      render json: { 
        success: true, 
        message: results.join("\n")
      }
    end
  end
end 