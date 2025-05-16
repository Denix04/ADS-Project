class Transaction < ActiveRecord::Base
  belongs_to :origin, class_name: 'Account'
  belongs_to :destination, class_name: 'Account'
end

