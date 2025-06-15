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
      password_digest: user_info[:password]
    )

    user_account = Account.create!(
      user: user,
      saldo: 10000,
      cbu: 123454660,
      alias: "#{user.name.downcase}_principal",
      es_subcuenta: false)

    user.save!
  end

  def self.login(log_info)
    user = User.find_by([email: log_info[:email]])
    if user.nil?
      nil
    else
      user.id
    end
  end
end
