class InventoryItem < ApplicationRecord
  # Validations
  validates :barcode, presence: true, uniqueness: true
  validates :category, presence: true, length: { minimum: 1 }
  validates :status, presence: true
  validates :in_stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Constants
  STATUS_IN_CIRCULATION = 'in_circulation'
  STATUS_REMOVED = 'removed'

  # Scopes
  scope :in_circulation, -> { where(status: STATUS_IN_CIRCULATION) }
  scope :removed, -> { where(status: STATUS_REMOVED) }

  # Instance methods
  def in_circulation?
    status == STATUS_IN_CIRCULATION
  end

  def removed?
    status == STATUS_REMOVED
  end

  # Class methods
  def self.generate_barcode
    # Generate a unique barcode using timestamp and random number
    timestamp = Time.current.strftime('%Y%m%d%H%M%S')
    random = rand(1000..9999)
    "FC-#{timestamp}-#{random}"
  end
end
