class AmountRestriction < Restriction
    validates :monto, presence: true, numericality: { greater_than: 0 }
  end
  