class Account < ActiveRecord::Base
    has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'origin_id'
    has_many :received_transactions, class_name: 'Transaction', foreign_key: 'destination_id'
  end
  