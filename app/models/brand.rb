class Brand
  include Mongoid::Document
  belongs_to :customer
  validates :name, presence: true, uniqueness: true
  
  field :name, type: String
end
