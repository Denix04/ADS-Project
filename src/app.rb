require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'yaml'

require_relative 'frontend'
require_relative 'backend/backendEndpoint'
require_relative 'backend/model/user'
require_relative 'backend/model/account'
require_relative 'backend/model/transaction'
require_relative 'backend/model/movement'
require_relative 'backend/model/transfer'


require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/wallet_development.sqlite3'  # la misma ruta que usas en sqlite3 CLI
)


# Configuración dinámica según entorno
#if defined?(Sinatra)
 # env = ENV['RACK_ENV'] || ENV['APP_ENV'] || 'development'
  #db_config = YAML.load_file(File.expand_path('../config/database.yml', __dir__), aliases: true)
  #set :database, db_config[env]
#end



