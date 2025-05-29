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

get '/register' do
  erb :register
end