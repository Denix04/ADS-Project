require_relative '../model/user'
require_relative '../model/account'
require_relative '../model/movement'
require_relative '../model/transfer'

module TransferCtl
  def self.do_transfer(params, session)
    user = User.find_by(id: session[:id])
    return { success: false, error: "Usuario no autenticado" } if user.nil?

    origin_account = user.account
    return { success: false, error: "Cuenta de origen no encontrada" } if origin_account.nil?

    # Buscar cuenta destino por alias o CBU
    destination_account = Account.find_by(alias: params[:cbu]) || Account.find_by(cbu: params[:cbu])
    return { success: false, error: "Cuenta destino no encontrada" } if destination_account.nil?

    begin
      Transfer.create!(
        origin: origin_account,
        destination: destination_account,
        amount: params[:amount].to_f,
        date: DateTime.now
      )
      { success: true }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, error: e.record.errors.full_messages.join(", ") }
    end
  end
end
