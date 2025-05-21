class Transfer < Movement
  validates :origin, presence: true
  validates :destination, presence: true
  validate :origin_has_sufficient_funds

  after_create :transfer_balance

  private

  def origin_has_sufficient_funds
    if origin.present? && amount.present? && origin.saldo < amount
      errors.add(:origin, "no tiene fondos suficientes para transferir #{amount}")
    end
  end

  def transfer_balance
    ActiveRecord::Base.transaction do
      origin.update!(saldo: origin.saldo - amount)
      destination.update!(saldo: destination.saldo + amount)
    end
  end
end
