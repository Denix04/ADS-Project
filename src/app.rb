require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
set :database, {adapter: "sqlite3", database: "db/wallet_development.sqlite3"}


require_relative 'frontend'
require_relative 'backend/backendEndpoint'
require_relative 'backend/model/user'



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
