require 'sinatra'
require_relative 'controller/userCtl'

get '/api' do
  'hello to de api'
end

get '/api/user' do
  'hello to the user'
end

post '/api/register' do
  user = User.new(
    name: params[:nombre],
    dni: params[:dni],
    localidad: params[:localidad],
    email: params[:email],
    password_digest: params[:password]
  )

  if UserCtl.register_user user
    redirect '/'
  end
end

get '/api/service' do
  'hello to the service'
end
