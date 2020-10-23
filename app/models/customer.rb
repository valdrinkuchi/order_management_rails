class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :brands, dependent: :destroy
  has_many :calculations, through: :orders
  validates :number, presence: true, uniqueness: true
  validates :name, :short_name, uniqueness: true
end
