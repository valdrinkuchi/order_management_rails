class Producer
  include Mongoid::Document
  field :number, type: Integer
  field :name, type: String
  field :short_name, type: String
  field :address, type: String
  field :bonus, type: Float

  has_many :productions, dependent: :destroy
  validates :name, :short_name, uniqueness: true
end
