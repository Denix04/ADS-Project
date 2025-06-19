require 'sinatra'

require_relative './backend/controller/user_ctl'

# Rutas que no requieren iniciar sesión
PUBLIC_ROUTES = ['/', '/login', '/register', 'publicview','/about', 'unauthorized'] 

before do
  # Si ya hay sesión, no dejar entrar a publicview, login ni register
  if session[:id] && ['/', '/login', '/register', 'publicview'].include?(request.path_info)
    redirect '/main'
  end

  if request.request_method == "GET"
    unless PUBLIC_ROUTES.include?(request.path_info) || session[:id]
      redirect '/login'
    end
  end
end

get '/login' do
  erb :login
end

get '/main' do
  @user = User.find(session[:id])
  erb :main
end

get '/mainmenu' do
  @user = User.find(session[:id])
  erb :mainmenu
end

get '/deposit' do
  @user = User.find(session[:id])
  @account = @user.account
  erb :deposit
end


get '/transfer' do
  erb :transfer
end

get '/charging' do
  erb :charging
end

get '/register' do
  erb :register
end

get '/unauthorized' do
  erb :unauthorized
end

get '/registerSecAccount' do
  @user = User.find(session[:id])
  @account = @user.account

  if @account.es_subcuenta
    redirect '/unauthorized'
  else
    erb :registerSecAccount
  end
end

get '/servicio' do
  erb :servicio
end

get '/perfil' do
  begin
    @user = User.find(session[:id])
    @account = @user.account
    @subaccounts = @account.subaccounts if @account #para mostrar las info de las subcuentas si tiene
    erb :perfil

  rescue ActiveRecord::RecordNotFound
    status 404
    'Usuario no encontrado'
  end
end

get '/movimientos' do
  @user = User.find(session[:id])
  @account = @user.account
  # Movimientos donde la cuenta es origen (egreso) o destino (ingreso)
  @movements = Movement.where("origin_id = ? OR destination_id = ?", @account.id, @account.id).order(date: :desc)
  erb :movements
end

get '/' do
  erb :publicview
end

get '/servicepayment' do
  @user = User.find(session[:id])
  erb :servicio
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/subaccount/:id' do
  @subaccount = Account.find(params[:id])
  @user = @subaccount.user
  @movements = Movement.where("origin_id = ? OR destination_id = ?", @subaccount.id, @subaccount.id).order(date: :desc)
  erb :perfilsecundario
end

get '/about' do
  erb :about
end
