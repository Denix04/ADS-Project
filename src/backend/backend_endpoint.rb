require 'sinatra'
require_relative 'controller/user_ctl'
require_relative 'controller/transfer_ctl'
require_relative 'controller/servicepayment_ctl'
require_relative 'controller/deposit_ctl'

get '/api' do
  'hello to de api'
end

get '/api/user' do
  'hello to the user'
end

post '/api/login' do
  user_id = UserCtl.login params
  if !user_id.nil?
    session[:id] = user_id
    redirect '/main'
  else
    result = { success: false, error: 'Contrazeña o Email invalido' }
    redirect "/login?error=#{Rack::Utils.escape(result[:error])}"
  end
end

post '/api/register' do
  if UserCtl.register params
    result = { success: true, msj: 'Usuario registrado con exito' }
    redirect "/login?success=#{Rack::Utils.escape(result[:msj])}"
  end
end

post '/api/registerSecAccount' do
  if UserCtl.register_Sec_Account(params, session)
    result = { success: true, msj: 'Usuario secundario registrado con exito' }
    redirect "/login?success=#{Rack::Utils.escape(result[:msj])}"
  end
end

post '/api/transfer' do
  result = TransferCtl.do_transfer(params, session)
  if result[:success]
    redirect '/transfer?success=1'
  else
    redirect "/transfer?error=#{Rack::Utils.escape(result[:error])}"
  end
end

post '/api/servicepayment' do
  result = ServicePaymentCtl.do_payment(params, session)

  if result[:success]
    redirect '/servicepayment?success=1'
  else
    redirect "/servicepayment?error=#{Rack::Utils.escape(result[:error])}"
  end
end

post '/api/deposit' do
  result = DepositCtl.create_deposit(
    { amount: params[:amount] }, session
  )

  if result[:success]
    redirect "/deposit?success=ok"
  else
    redirect "/deposit?error=#{Rack::Utils.escape(result[:error])}"
  end
end
