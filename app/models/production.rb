class Production
  include Mongoid::Document
  field :load_count, type: Integer
  field :load_date, type: Date
  field :price, type: Float
  field :bonus, type: Float

  belongs_to :order
  belongs_to :producer
  embeds_one :calculation
  # validate :production_validate
  before_save :assign_production
  after_save :save_calculation
  def save_calculation
    return if load_count.nil? || load_date.nil?

    if Calculation.where(production: self) != []
      Calculation.update(production: self)
    else
      Calculation.create(production: self)
    end
  end

  def assign_production
    return if load_count.nil? || load_date.nil?

    Order.update(in_production: true)
  end

  private

  def production_validate
    return if load_count.nil? || load_date.nil?

    if load_date < order.due
      errors.add(:production, message: 'Load date cannot be same or earlier as Due date')
    elsif price > order.price
      errors.add(:production, message: 'Production price cannot be greater than Saling price')
    end
  end
end
