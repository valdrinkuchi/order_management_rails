class Order < ApplicationRecord
  belongs_to :customer
  has_one :production, dependent: :destroy
  has_one :calculation, through: :production
  validates :number, uniqueness: true, presence: true
  validates :price, :due, presence: true
  validate :order_validation

  private

  def order_validation
    errors.add(:order, message: 'Due date cannot be same or earlier as Signed date') if due.present? && signed.present? && due <= signed
  end
end
