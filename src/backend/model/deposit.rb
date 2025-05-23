class Deposit < Movement
    validate :origin_must_be_nil
    validates :destination, presence: true
    
    private
  
    def origin_must_be_nil
      if origin.present?
        errors.add(:origin, "must be nil for a deposit")
      end
    end
  end