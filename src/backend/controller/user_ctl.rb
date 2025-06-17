require 'bcrypt'
require_relative '../model/user'
require_relative '../model/account'

module UserCtl
  def self.register(user_info)

    user = User.new(
      name: user_info[:name],
      last_name: user_info[:last_name],
      dni: user_info[:dni],
      localidad: user_info[:locality],
      email: user_info[:email],
      password_digest: BCrypt::Password.create(user_info[:password_digest])
    )

    user_account = Account.create!(
      user: user,
      saldo: 10000,
      alias: "#{user.name.downcase}_principal",
      es_subcuenta: false
    )

    user.save!
  end

  def self.register_Sec_Account(user_info, principal)

    user = User.new(
      name: user_info[:name],
      last_name: user_info[:last_name],
      dni: user_info[:dni],
      localidad: user_info[:locality],
      email: user_info[:email],
      password_digest: BCrypt::Password.create(user_info[:password_digest])
    )

    principal_account = User.find(principal[:id]).account

    user_account = Account.create!(
      user: user,
      saldo: 10000,
      alias: "#{user.name.downcase}_principal",
      es_subcuenta: true,
      principal_account: principal_account
    )

    user.save!
  end

  def self.login(log_info)
    user = User.find_by(email: log_info[:email])
    return nil unless user

    if BCrypt::Password.new(user.password_digest) == log_info[:password_digest]
      user.id
    end
  end
end
