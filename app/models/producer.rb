class Producer
  include Mongoid::Document
  has_many :productions, dependent: :destroy
  # has_many :calculations
  validates :name, :short_name, uniqueness: true

  field :number, type: Integer
  field :name, type: String
  field :short_name, type: String
  field :address, type: String
  field :bonus, type: Float
end
