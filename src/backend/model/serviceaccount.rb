class ServiceAccount < ApplicationRecord

    has_many :accounts, foreign_key: :service_account_id
    has_many :movement          #pagos realizados a esta cuenta servicio
  
   
    validates :id_cliente, presence: true
    validates :nombre_responsable, presence: true
    validates :fecha_asociacion, presence: true
  end
  