class Order
  include Mongoid::Document
  field :number, type: Integer
  field :price, type: Float
  field :signed, type: Date
  field :due, type: Date
  field :count, type: Integer
  field :in_production, type: Boolean, default: false

  validates :number, uniqueness: true, presence: true
  validates :price, :due, presence: true
  before_save :order_validation

  belongs_to :brand

  private

  def order_validation
    return if due.present? && signed.present? && due <= signed

    errors.add(:order, message: 'Due date cannot be same or earlier as Signed date')
  end
end
