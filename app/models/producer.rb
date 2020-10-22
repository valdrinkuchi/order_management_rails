class Producer < ApplicationRecord
	has_many :productions, dependent: :destroy
	has_many :calculations, through: :productions
end
