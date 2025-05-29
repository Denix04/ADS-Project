require 'sinatra'

get '/' do
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

post '/' do
  erb :main
end

post '/register' do
  erb :login
end

post '/servicio' do
  erb :main
end