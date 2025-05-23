class TimeRestriction < Restriction
    validates :horario_inicio, :horario_fin, presence: true
    validate :validar_rango_horario
  
    private
  
    def validar_rango_horario
      if horario_inicio && horario_fin && horario_fin <= horario_inicio
        errors.add(:horario_fin, "debe ser posterior a la hora de inicio")
      end
    end
  end
  