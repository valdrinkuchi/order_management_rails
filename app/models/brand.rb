class Brand
  include Mongoid::Document
  field :name, type: String

  belongs_to :customer
  has_many :orders, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
