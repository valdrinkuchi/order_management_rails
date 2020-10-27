class Order
  include Mongoid::Document
  belongs_to :customer
  has_one :production, dependent: :destroy
  # has_one :calculation

  validates :number, uniqueness: true, presence: true
  validates :price, :due, presence: true
  validate :order_validation

  field :number, type: Integer
  field :price, type: Float
  field :signed, type: Date
  field :due, type: Date
  field :count, type: Integer
  field :in_produciton, type: Mongoid::Boolean

  private

  def order_validation
    return if due.present? && signed.present? && due <= signed

    errors.add(:order, message: 'Due date cannot be same or earlier as Signed date')
  end
end
