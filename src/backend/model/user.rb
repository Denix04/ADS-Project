require 'active_record'
class User < ActiveRecord::Base
    has_secure_password

    has_one :account
    validates :dni, presence: true, uniqueness: true
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true

end
