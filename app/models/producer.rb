class Producer < ApplicationRecord
  has_many :productions, dependent: :destroy
  has_many :calculations, through: :productions
  validates :name, :short_name, uniqueness: true
end
