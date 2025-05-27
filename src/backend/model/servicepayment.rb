class ServicePayment < Movement
    
    belongs_to :service_account  # asociación a la cuenta de servicio que se paga
   
  end
  