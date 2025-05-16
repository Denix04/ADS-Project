require 'sinatra'

get '/api' do
  'hello to de api'
end

get '/api/user' do
  'hello to the user'
end

get '/api/service' do
  'hello to the service'
end
