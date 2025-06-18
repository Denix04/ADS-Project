require_relative '../model/movement'
require_relative '../model/deposit'
require_relative '../model/account'
require_relative '../model/user'

module DepositCtl
  def self.create_deposit(deposit_info, session)
    user = User.find_by(id: session[:id])
    return { error: "Usuario no autenticado" } if user.nil?

    destination_account = user.account
    amount = deposit_info[:amount].to_f

    return { error: "Cuenta destino no encontrada" } if destination_account.nil?
    return { error: "El monto debe ser mayor a 0" } if amount <= 0

    deposit = Deposit.new(
      destination: destination_account,
      amount: amount,
      date: Time.now
    )

    if deposit.save
      ActiveRecord::Base.transaction do
        destination_account.update!(saldo: destination_account.saldo + amount)
      end
      { success: true, deposit: deposit }
    else
      { error: deposit.errors.full_messages.join(", ") }
    end
  end
end
