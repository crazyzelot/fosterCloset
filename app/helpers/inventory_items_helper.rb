module InventoryItemsHelper
  def barcode_image(barcode)
    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/png_outputter'

    barcode = Barby::Code128.new(barcode)
    outputter = Barby::PngOutputter.new(barcode)
    outputter.height = 100
    outputter.margin = 10
    outputter.xdim = 2

    # Convert to base64 for embedding in HTML
    base64 = Base64.strict_encode64(outputter.to_png)
    image_tag "data:image/png;base64,#{base64}", class: "mx-auto"
  end
end 