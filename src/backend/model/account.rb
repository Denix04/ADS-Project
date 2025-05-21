class Account < ActiveRecord::Base
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'origin_id'
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'destination_id'

  has_many :sent_movements, class_name: 'Movement', foreign_key: 'origin_id'
  has_many :received_movements, class_name: 'Movement', foreign_key: 'destination_id'
end
