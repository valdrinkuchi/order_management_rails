class Customer
  include Mongoid::Document

  has_many :orders
  has_many :brands
  # has_many :calculations
  validates :number, presence: true, uniqueness: true
  validates :name, :short_name, uniqueness: true

  field :number, type: Integer
  field :name, type: String
  field :short_name, type: String
  field :address, type: String
  field :delivery_address, type: String
end
