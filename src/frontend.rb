require 'sinatra'

require_relative './backend/controller/user_ctl'

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

get '/transfer' do
  erb :transfer
end

get '/charging' do
  erb :charging
end

get '/register' do
  erb :register
end

get '/registerSecAccount' do
  erb :registerSecAccount
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
  redirect '/login'
end

