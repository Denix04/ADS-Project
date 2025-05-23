require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

require_relative 'frontend'
require_relative 'backend/backendEndpoint'
require_relative 'backend/model/user'
require_relative 'backend/model/account'
require_relative 'backend/model/transaction'
require_relative 'backend/model/movement'
require_relative 'backend/model/transfer'


set :database, {adapter: "sqlite3", database: "db/wallet_development.sqlite3"}
