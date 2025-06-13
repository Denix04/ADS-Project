require 'active_record'

require_relative '../src/app'

env = ENV['RACK_ENV'] || 'test'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/#{env}.sqlite3"
)
