class Order
  include Mongoid::Document
  belongs_to :customer
  belongs_to :brand
  validates :number, uniqueness: true, presence: true
  validates :price, :due, presence: true
  validate :order_validation

  field :number, type: Integer
  field :price, type: Float
  field :signed, type: Date
  field :due, type: Date
  field :count, type: Integer
  field :in_production, type: Boolean, default: false

  private

  def order_validation
    return if due.present? && signed.present? && due <= signed

    errors.add(:order, message: 'Due date cannot be same or earlier as Signed date')
  end
end
