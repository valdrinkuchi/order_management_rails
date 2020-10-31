
class Calculation
  include Mongoid::Document
  field :sale_neto, type: Float
  field :sale_vat, type: Float
  field :sale_gross, type: Float
  field :buy_neto, type: Float
  field :buy_bonus, type: Float
  field :buy_gross, type: Float
  field :profit, type: Float
  field :days_late, type: Integer
  field :amount_difference, type: Integer
  filed :description, type: String
  VAT = 0.16

  belongs_to :production
  before_save :create_calculation

  def create_calculation
    self.sale_neto = sale_neto
    self.sale_vat = sale_vat
    self.sale_gross = sale_gross
    self.buy_neto = buy_neto
    self.buy_bonus = buy_bonus
    self.buy_gross = buy_gross
    self.profit = profit
    self.days_late = days_late
    self.amount_difference = amount_difference
  end

  def sale_neto
    production.order.price * production.load_count
  end

  def sale_vat
    sale_neto * VAT
  end

  def sale_gross
    sale_neto + sale_vat
  end

  def buy_neto
    (production.price * production.load_count * production.bonus) / 100
  end

  def buy_bonus
    buy_neto * production.bonus
  end

  def buy_gross
    buy_neto + buy_bonus
  end

  def profit
    sale_neto - buy_neto
  end

  def days_late
    production.load_date - production.order.due
  end

  def amount_difference
    production.load_count - production.order.count
  end
end
