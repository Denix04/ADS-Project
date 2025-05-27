class ServicePayment < Movement
    
    belongs_to :service_account  # asociación a la cuenta de servicio que se paga
    #agregar un service account id para guardar a que service account se hizo el pago
   
  end
  