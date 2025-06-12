# spec/models/user_spec.rb
require 'spec_helper'
require 'active_record'
require_relative '../../src/backend/model/user'  # ajustá esta ruta si lo guardás en otro lado

RSpec.describe User, type: :model do
 
  it "es válido con atributos válidos" do
    user = User.new(
      name: "Camila",
      dni: "12345678",
      email: "camila@example.com",
      password: "secreto",
      password_confirmation: "secreto"
    )
    expect(user).to be_valid
  end

  it "es inválido sin email" do
    user = User.new(name: "Sin Email", dni: "12345679", password: "123", password_confirmation: "123")
    expect(user).not_to be_valid
  end



it "es inválido sin dni" do
    user = User.new(
      name: "Camila",
      email: "camila@example.com",
      password: "secreto",
      password_confirmation: "secreto"
    )
    expect(user).not_to be_valid
  end

  it "no permite emails duplicados" do
    User.create!(email: "test@example.com")
    duplicate = User.new(email: "test@example.com")
    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:email]).to include("has already been taken")
  end
end