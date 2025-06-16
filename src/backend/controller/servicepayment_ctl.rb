require_relative '../model/user'
require_relative '../model/account'
require_relative '../model/movement'
require_relative '../model/servicepayment'

module ServicePaymentCtl
  def self.do_payment(params, session)
    user = User.find_by(id: session[:id])
    return { success: false, error: "Usuario no autenticado" } if user.nil?

    origin_account = user.account
    return { success: false, error: "Cuenta de origen no encontrada" } if origin_account.nil?

   
    begin
      ServicePayment.create!(
        origin: origin_account,
        amount: params[:amount].to_f,
        date: DateTime.now
      )
      { success: true }
    rescue ActiveRecord::RecordInvalid => e
      { success: false, error: e.record.errors.full_messages.join(", ") }
    end
  end
end
