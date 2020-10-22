class Production < ApplicationRecord
  belongs_to :order
  belongs_to :producer
  has_one :calculation, dependent: :destroy

  after_save :save_calculation, if: @load_count && @load_date

  def save_calculation
    if Calculation.where(production: self) != []
      Calculation.update(production: self)
    else
      Calculation.create(production: self)
    end
  end
end
