class Movement < ActiveRecord::Base
  self.table_name = 'movements'

  belongs_to :origin, class_name: 'Account', optional: true
  belongs_to :destination, class_name: 'Account', optional: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
end
