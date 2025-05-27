  class Restriction < ApplicationRecord
    belongs_to :cuenta_primaria, class_name: 'Account'
    belongs_to :subcuenta, class_name: 'Account'
  
    serialize :dias, Array
  
    validates :cuenta_primaria, presence: true
    validates :subcuenta, presence: true
    validates :dias, presence: true
    
    validate :cuentas_diferentes
    validate :is_subcuenta
    private
  
    # Validar que las cuentas sean distintas
    def cuentas_diferentes
      if cuenta_primaria_id == subcuenta_id
        errors.add(:subcuenta, "no puede ser la misma que cuenta primaria")
      end
    end

     # Validar que la subcuenta sea subcuenta
     def is_subcuenta
        if subcuenta_es_subcuenta == false
          errors.add(:subcuenta, "no es cuenta secundaria")
        end
      end
  end
  