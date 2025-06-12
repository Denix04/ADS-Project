require 'sinatra'

get '/login' do
  erb :login
end

get '/main' do
  erb :main
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

get '/servicio' do
  erb :servicio
end

get '/perfil' do
  erb :perfil
end

get '/perfil/:id'do
  begin
    @user = User.find(params[:id]) #buscar el usuario por id para mostrar datos de us
    @account = @user.account #para mostrar su cbu y alias
    @subaccounts = @account.subaccounts if @account #para mostrar las info de las subcuentas si tiene
    

    erb :perfil
  rescue ActiveRecord::RecordNotFound
    status 404
    "Usuario no encontrado"
  end
end



get '/movimientos' do
  erb :movements
end

get '/' do
  erb :publicview
end



post '/' do
  erb :main
end

post '/register' do
  erb :login
end

post '/servicio' do
  erb :main
end