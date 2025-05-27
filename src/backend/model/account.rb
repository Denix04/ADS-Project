class Account < ActiveRecord::Base
  belongs_to :user
  has_many :sent_movements, class_name: 'Movement', foreign_key: 'origin_id'
  has_many :received_movements, class_name: 'Movement', foreign_key: 'destination_id'

  validates :cbu, uniqueness: true, allow_nil: true
  validates :alias, uniqueness: true, allow_nil: true
  validates :numcuenta, uniqueness: true, allow_nil: true
  validates :saldo, numericality: { greater_than_or_equal_to: 0 }

end
