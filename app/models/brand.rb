class Brand < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true, uniqueness: true
end
