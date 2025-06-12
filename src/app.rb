require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3'
require 'dotenv/load'

require_relative 'frontend'
require_relative 'backend/backend_endpoint'

env = ENV['RACK_ENV'] || 'development'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/#{env}.sqlite3"
)

enable :sessions
set :session_secret, ENV['SESSION_SECRET_PASSWORD']
