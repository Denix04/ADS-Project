class Account < ActiveRecord::Base
  belongs_to :user
  has_many :sent_movements, class_name: 'Movement', foreign_key: 'origin_id'
  has_many :received_movements, class_name: 'Movement', foreign_key: 'destination_id'

  validates :cbu, uniqueness: true, allow_nil: true
  validates :alias, uniqueness: true, allow_nil: true
  validates :alias, length: { maximum: 50 }, allow_blank: true
  validates :saldo, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :principal_account, class_name: 'Account', optional: true
  has_many :subaccounts, class_name: 'Account', foreign_key: 'principal_account_id'

   # Si es_subcuenta es true, debe tener cuenta principal
   validates :principal_account, presence: true, if: :es_subcuenta?

   # Si es_subcuenta es false, no debe tener principal_account
   validate :principal_account_must_be_nil_if_not_subaccount

   validate :principal_account_cannot_be_self

  validate :principal_account_no_puede_ser_subcuenta

 
   private
 
   def principal_account_must_be_nil_if_not_subaccount
     if !es_subcuenta && principal_account_id.present?
       errors.add(:principal_account, "debe ser nulo si no es una subcuenta")
     end
    end

  def principal_account_cannot_be_self
    if principal_account_id.present? && principal_account.id == id
      errors.add(:principal_account, "no puede ser la misma cuenta")
    end
  end

  def principal_account_no_puede_ser_subcuenta
    if principal_account && principal_account.es_subcuenta
      errors.add(:principal_account, "no puede ser una subcuenta")
    end
  end
   end

