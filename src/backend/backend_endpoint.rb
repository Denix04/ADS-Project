require 'sinatra'
require_relative 'controller/user_ctl'

get '/api' do
  'hello to de api'
end

get '/api/user' do
  'hello to the user'
end

post '/api/login' do
  user_id = UserCtl.login params
  if !user_id.nil?
    session[:id] = user_id
    redirect '/perfil'
  else
    'invalid email or password'
  end
end
    
post '/api/register' do
  if UserCtl.register params
    redirect '/'
  end
end
