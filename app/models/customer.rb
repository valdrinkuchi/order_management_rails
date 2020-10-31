class Customer
  include Mongoid::Document
  field :number, type: Integer
  field :name, type: String
  field :short_name, type: String
  field :address, type: String
  field :delivery_address, type: String

  has_many :orders, dependent: :destroy
  has_many :brands, dependent: :destroy
  validates :number, presence: true, uniqueness: true
  validates :name, :short_name, uniqueness: true
end
