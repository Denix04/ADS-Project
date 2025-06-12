require 'sinatra/activerecord'
require 'sqlite3'
require_relative '../src/backend/model/user'
require_relative '../src/backend/model/account'

# Conexión a la base de datos
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/wallet_development.sqlite3'
)

# Borra datos previos (opcional, para evitar duplicados)
Account.delete_all # siempre se debe borrar primero las cuentas
User.delete_all

# Crea usuarios y cuentas principales
usuarios = [
  {
    name: 'Mariana',
    last_name: 'Gonzáles',
    dni: '12345678',
    localidad: 'Buenos Aires',
    email: 'mgonzales@gmail.com',
    password: 'secreto',
    fecha_nacimiento: '1961-06-22'},
  {
    name: 'Bruno',
    last_name: 'Debenardi',
    dni: '87654321',
    localidad: 'Córdoba',
    email: 'bdebenardi@gmail.com',
    password: 'secreto',
    fecha_nacimiento: '1990-01-15'},
  {
    name: 'Lucía',
    last_name: 'Fernández',
    dni: '98765432',
    localidad: 'Rosario',
    email: 'lg@gmail.com',
    password: 'contraseña',
    fecha_nacimiento: '1985-03-10'
  }
]

# Guardamos las cuentas principales para vincularlas con las secundarias
cuentas_principales = []

usuarios.each do |attrs|
  user = User.create!(attrs)
  cuenta_principal = Account.create!(user: user, saldo: 10000, alias: "#{user.name.downcase}_principal", es_subcuenta: false)
  cuentas_principales << cuenta_principal
end

# Crea usuarios y cuentas secundarias, asociadas a las principales (por índice en este ejemplo)
secundarias = [
  {
    name: 'Pedro',
    last_name: 'Gonzáles',
    dni: '21315678',
    localidad: 'Buenos Aires',
    email: 'pgonzales@gmail.com',
    password: 'secreto',
    fecha_nacimiento: '2002-06-22'},
  {
    name: 'Ana',
    last_name: 'Debenardi',
    dni: '813221321',
    localidad: 'Córdoba',
    email: 'adebenardi@gmail.com',
    password: 'secreto',
    fecha_nacimiento: '2003-01-15'}
]

cuenta = cuentas_principales[0]
secundarias.each do |attrs|
  user = User.create!(attrs)
  Account.create!(
    user: user,
    saldo: 10000,
    alias: "#{user.name.downcase}_secundaria",
    es_subcuenta: true,
    principal_account: cuenta
  )
end

puts 'Seeds cargados correctamente'
