class Customer < ApplicationRecord
	has_many :orders, dependent: :destroy
	has_many :brands
	has_many :calculations, through: :orders
	# validates :number, presence: true
end
