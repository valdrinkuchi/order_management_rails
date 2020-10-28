class Brand
  include Mongoid::Document
  belongs_to :customer
  has_many :orders
  validates :name, presence: true, uniqueness: true
  field :name, type: String
end
