require 'sinatra'
require 'active_record'
require 'mysql2'
require 'dotenv/load'

require_relative 'frontend'
require_relative 'backend/backendEndpoint'
require_relative 'backend/model/user'

DB = ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     ENV['DB_HOST'],
  database: ENV['DB_NAME'],
  user:     ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
)
