class Brand < ApplicationRecord
  belongs_to :customer, dependent: :destroy 
  validates :name, presence: true
end
